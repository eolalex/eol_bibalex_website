class Resource
  include ActiveModel::Model
  
  attr_accessor :id, :name, :origin_url, :resource_data_set, :description,:type, :uploaded_url,:path, :last_harvested_at,
                :harvest_frequency, :day_of_month, :nodes_count, :position, :is_paused, :is_approved, :is_trusted,
                :is_autopublished, :is_forced, :dataset_license, :is_harvest_inprogress, :forced_internally,
                :dataset_rights_statement, :dataset_rights_holder, :default_license_string, :default_rights_statement,
                :default_rights_holder, :default_language_id, :harvests, :created_at, :updated_at, :flag

  validates_presence_of :name, :type 
  validates_presence_of :uploaded_url, if: :is_url?
  validates_presence_of :path, if: :is_file?, if: :flag

  validates_length_of :name , maximum: 255
  validates_length_of :uploaded_url , allow_blank: true , allow_nil: true  , maximum: 255
  validates_length_of :path , allow_blank: true , allow_nil: true  , maximum: 255
  validates_length_of :description , allow_blank: true , allow_nil: true , maximum: 255
  validates_length_of :default_rights_holder, allow_blank: true , allow_nil: true , maximum: 255
  validates_length_of :default_rights_statement, allow_blank: true , allow_nil: true , maximum: 400

  def is_url?
    type.eql?("url")
  end

  def is_file?
    type.eql?("file")
  end

  class << self
    def native
      Rails.cache.fetch('resources/native') do
        Resource.where(abbr: 'DWH').first_or_create do |r|
          r.name = 'EOL Dynamic Hierarchy'
          r.partner = Partner.native
          r.description = 'TBD'
          r.abbr = 'DWH'
          r.is_browsable = true
          r.has_duplicate_nodes = false
        end
      end
    end

    # Required to read the IUCN status
    def iucn
      Rails.cache.fetch('resources/iucn') do
        Resource.where(abbr: 'IUCN-SD').first_or_create do |r|
          r.name = 'IUCN Structured Data'
          r.partner = Partner.native
          r.description = 'TBD'
          r.abbr = 'IUCN-SD'
          r.is_browsable = true
          r.has_duplicate_nodes = false
        end
      end
    end

    # Required to find the "best" Extinction Status: TODO: update the name when
    # we actually have the darn resource.
    def extinction_status
      Rails.cache.fetch("resources/extinction_status") do
        Resource.where(name: "Extinction Status").first_or_create do |resource|
          resource.name = "Extinction Status"
          resource.partner = Partner.native
          resource.description = "TBD"
          resource.is_browsable = true
          resource.has_duplicate_nodes = false
        end
      end
    end

    # Required to find the "best" Extinction Status:
    def paleo_db
      Rails.cache.fetch('resources/paleo_db') do
        Resource.where(abbr: 'pbdb').first_or_create do |resource|
          resource.name = 'The Paleobiology Database'
          resource.partner = Partner.native
          resource.description = 'TBD'
          resource.abbr = 'pbdb'
          resource.is_browsable = true
          resource.has_duplicate_nodes = false
        end
      end
    end

    def trait_headers
      # NOTE: This order is deterministic and conflated with HarvDB's app/models/publisher.rb
      # if you change one, you must change the other.
      %i[eol_pk page_id scientific_name resource_pk predicate sex lifestage statistical_method source
         object_page_id target_scientific_name value_uri literal measurement units]
    end

    def meta_headers
      # NOTE: This order is deterministic and conflated with HarvDB's app/models/publisher.rb
      # if you change one, you must change the other.
      %i[eol_pk trait_eol_pk predicate literal measurement value_uri units sex lifestage
        statistical_method source]
    end
  end

  def create_log
    ImportLog.create(resource_id: id, status: "currently running")
  end

  def remove_content
    # NOTE: this does NOT remove TraitBank content (because there are cases where you want to reload the relational DB but
    # leave the expensive traits in place) Run TraitBank::Admin.remove_for_resource(resource) to accomplish that.

    # Node ancestors
    nuke(NodeAncestor)
    # Node identifiers
    nuke(Identifier)
    # content_sections
    [Medium, Article, Link].each do |klass|
      all_pages = klass.where(resource_id: id).pluck(:page_id)
      field = "#{klass.name.pluralize.downcase}_count"
      all_pages.in_groups_of(2000, false) do |pages|
        Page.where(id: pages).update_all("#{field} = #{field} - 1")
        klass.where(resource_id: id).select("id").find_in_batches do |group|
          ContentSection.where(["content_type = ? and content_id IN (?)", klass.name, group.map(&:id)]).delete_all
          if klass == Medium
            # TODO: really, we should make note of these pages and "fix" their icons, now (unless the page itself is being
            # deleted):
            PageIcon.where(["medium_id IN (?)", group]).delete_all
          end
        end
      end
    end
    # javascripts
    nuke(Javascript)
    # locations
    nuke(Location)
    # Bibliographic Citations
    nuke(BibliographicCitation)
    # references, referents
    nuke(Reference)
    nuke(Referent)
    fix_missing_page_contents(delete: true)
    nuke(ImageInfo)
    nuke(ImportLog)
    nuke(Medium)
    # Articles
    nuke(Article)
    # Links
    nuke(Link)
    # occurrence_maps
    nuke(OccurrenceMap)
    # Scientific Names
    nuke(ScientificName)
    # Vernaculars
    nuke(Vernacular)
    # Attributions
    nuke(Attribution)
    # Traits:
    TraitBank::Admin.remove_for_resource(self)
    # Update page node counts
    # Get list of affected pages
    pages = Node.where(resource_id: id).pluck(:page_id)
    pages.in_groups_of(10_000, false) do |group|
      Page.where(id: group).update_all("nodes_count = nodes_count - 1")
    end
    nuke(Node)
  end

  def nuke(klass)
    klass.where(resource_id: id).delete_all
  rescue
    sleep(2)
    ActiveRecord::Base.connection.reconnect!
    retry rescue nil
  end

  def fix_native_nodes
    node_ids = Node.where(resource_id: id).pluck(:id)
    node_ids.in_groups_of(1000, false) do |group|
      Page.fix_native_nodes(Page.where(native_node_id: group))
    end
  end

  def fix_missing_page_contents(options = {})
    delete = options.key?(:delete) ? options[:delete] : false
    [Medium, Article, Link].each { |type| fix_missing_page_contents_by_type(type, delete: delete) }
  end

  def fix_missing_page_contents_by_type(type, options = {})
    delete = options.key?(:delete) ? options[:delete] : false
    page_counts = {}
    type_table = type.table_name
    contents = PageContent.where(content_type: type.name, resource_id: id)
    if delete
      contents.joins(
        %Q{LEFT JOIN #{type_table} ON (page_contents.content_id = #{type_table}.id)}
      ).where("#{type_table}.id IS NULL")
    else
      PageContent
    end
    contents.pluck(:page_id).each {|pid| page_counts[pid] ||= 0 ; page_counts[pid] += 1}
    by_count = {}
    page_counts.each {|pid, count| by_count[count] ||= [] ; by_count[count] << pid}
    contents.delete_all if delete
    by_count.each do |count, pages|
      pages.in_groups_of(5_000, false) do |group|
        pages = Page.where(id: group)
        type_field = "#{type.table_name}_count"
        update =
          if delete
            "page_contents_count = IF(page_contents_count > #{count}, (page_contents_count - #{count}),0), "\
              "#{type_field} = IF(#{type_field} > #{count}, (#{type_field} - #{count}),0)"
          else
            "page_contents_count = page_contents_count + #{count}, #{type_field} = #{type_field} + #{count}"
          end
        pages.update_all(update)
      end
    end
  end

  def fix_missing_base_urls
    %w[base_url unmodified_url].each do |field|
      all = Medium.where(resource_id: id).where("#{field} LIKE 'data%'").select("id, #{field}")
      all.find_in_batches do |batch|
        Medium.where(id: batch.map(&:id)).update_all("#{field} = CONCAT('https://beta-repo.eol.org/', #{field})")
      end
    end
  end

  def import_traits(since)
    log = Publishing::PubLog.new(self)
    repo = Publishing::Repository.new(resource: self, log: log, since: since)
    log.log('Importing Traits ONLY...')
    begin
      Publishing::PubTraits.import(self, log, repo)
      log.log('NOTE: traits have been loaded, but richness has not been recalculated.', cat: :infos)
      log.complete
    rescue => e
      log.fail(e)
    end
    Rails.cache.clear
  end

  def slurp_traits
    TraitBank::Slurp.load_csvs(self)
  end

  def traits_file
    Rails.public_path.join("traits_#{id}.csv")
  end

  def meta_traits_file
    Rails.public_path.join("meta_traits_#{id}.csv")
  end

  def remove_traits_files
    File.unlink(traits_file) if File.exist?(traits_file)
    File.unlink(meta_traits_file) if File.exist?(meta_traits_file)
  end

  def import_media(since)
    log = Publishing::PubLog.new(self)
    repo = Publishing::Repository.new(resource: self, log: log, since: since)
    log.log('Importing Media ONLY...')
    begin
      Publishing::PubMedia.import(self, log, repo)
      log.log('NOTE: Media have been loaded, but richness has not been recalculated, page icons aren''t updated, and '\
        'media counts may be off.', cat: :infos)
      log.complete
    rescue => e
      log.fail(e)
    end
    Rails.cache.clear
  end
end
