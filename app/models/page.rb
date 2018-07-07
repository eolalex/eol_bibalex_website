class Page < ActiveRecord::Base

  has_many :collected_pages
  searchkick word_start: [:scientific_name]
  belongs_to :node
  has_many :scientific_names, class_name: 'ScientificName', primary_key: 'id', foreign_key: 'page'
  has_many :page_contents, class_name: 'PageContent', primary_key: 'id', foreign_key: 'page'
  has_many :media, through: :page_contents, source: :content, source_type: "Medium"
  has_many :articles, through: :page_contents, source: :content, source_type: "Article"
  has_and_belongs_to_many :referents  
  has_many :vernaculars,  class_name: "Vernacular", foreign_key: 'page_id'
  has_many :pages_node
  has_many :nodes, through: :pages_node
  
  def search_data
      {
        id: id,
        scientific_name: scientific_name
      }
  end
#   
   def scientific_name
    node.try(:scientific_name) || "No Name!"
   end
#   
  def synonyms
    scientific_names.synonym.map { |n| n.canonical_form }
  end
  
  def maps
    media.where(subclass: Medium.subclasses[:map])
  end


 # TRAITS METHODS

  def key_data
    return @key_data if @key_data
    data = TraitBank.key_data(id)
    key_data = {}
    seen = {}
    data.each do |predicate, traits|
      next if seen[predicate[:name]]
      seen[predicate[:name]] = true
        # TODO: we probably want to show multiple values, here, or at least
        # "pick wisely" somehow.
        key_data[predicate] = traits.first
      break if seen.size >= 5
    end
    key_data
  end

  def has_data?
    data_count > 0
  end

  def data(page = 1, per = 2000)
    return @data[0..per] if @data
    data = TraitBank.by_page(id, page, per)
    # Self-healing count of number of data:
    @data_toc_needs_other = false
    @data_toc = data.flat_map do |t|
      next if t[:predicate][:section_ids].nil? # Usu. test data...
      secs = t[:predicate][:section_ids].split(",")
      @data_toc_needs_other = true if secs.empty?
      secs.map(&:to_i)
    end.uniq
    @data_toc = Section.where(id: @data_toc) unless @data_toc.empty?
    @data_loaded = true
    @data = data
  end

  def iucn_status_key
    # NOTE this is NOT self-healing. If you store the wrong value or change it,
    # it is up to you to fix the value on the Page instance. This is something
    # to be aware of!
    if iucn_status.nil? && @data_loaded
      status = if grouped_data.has_key?(Eol::Uris::Iucn.status)
        recs = grouped_data[Eol::Uris::Iucn.status]
        record = recs.find { |t| t[:resource_id] == Resource.iucn.id }
        record ||= recs.first
        TraitBank::Record.iucn_status_key(record)
      else
        "unknown"
      end
      if iucn_status != status
        update_attribute(:iucn_status, status)
      end
      status
    else
      iucn_status
    end
  end


  def habitats
    if geographic_context.nil? && @data_loaded
      keys = grouped_data.keys & Eol::Uris.geographics
      habitat = if keys.empty?
        ""
      else
        habitats = []
        keys.each do |uri|
          recs = grouped_data[uri]
          habitats += recs.map do |rec|
            rec[:object_term] ? rec[:object_term][:name] : rec[:literal]
          end
        end
        habitats.join(", ")
      end
      if geographic_context != habitat
        update_attribute(:geographic_context, habitat)
      end
      habitat
    else
      geographic_context
    end
  end

  def should_show_icon?
    return nil unless native_node
    @should_show_icon ||= Rank.species_or_below.include?(native_node.rank_id)
  end

  def is_it_marine?
    if ! has_checked_marine? && @data_loaded
      recs = grouped_data[Eol::Uris.environment]
      if recs && recs.any? { |r| r[:object_term] &&
         r[:object_term][:uri] == Eol::Uris.marine }
        update_attribute(:is_marine, true)
        update_attribute(:has_checked_marine, true)
        return true
      else
        update_attribute(:is_marine, false)
        return false
      end
    else
      is_marine?
    end
  end

  def displayed_extinction_data
    recs = grouped_data[Eol::Uris.extinction]
    return nil if recs.nil? || recs.empty?
    # TODO: perhaps a better algorithm to pick which data to use if there's
    # more than one from a resource (probably the most recent):
    paleo = recs.find { |r| r[:resource_id] == Resource.paleo_db.id }
    ex_stat = recs.find { |r| r[:resource_id] == Resource.extinction_status.id }
    if paleo && ex_stat
      if ex_stat[:object_term] && ex_stat[:object_term][:uri] == Eol::Uris.extinct
        if paleo[:object_term] && paleo[:object_term][:uri] == Eol::Uris.extinct
          paleo
        else
          ex_stat
        end
      else
        nil
      end
    elsif paleo || ex_stat
      rec = [paleo, ex_stat].compact.first
      rec[:object_term] && rec[:object_term][:uri] == Eol::Uris.extinct ? rec :
        nil
    else
      recs.find { |rec| rec[:object_term] && rec[:object_term][:uri] == Eol::Uris.extinct }
    end
  end

  def is_it_extinct?
    if ! has_checked_extinct? && @data_loaded
      # NOTE: this relies on #displayed_extinction_data ONLY returning an
      # "exinct" record. ...which, as of this writing, it is designed to do.
      update_attribute(:has_checked_extinct, true)
      if displayed_extinction_data
        update_attribute(:is_extinct, true)
        return true
      else
        update_attribute(:is_extinct, false)
        return false
      end
    else
      is_extinct?
    end
  end

  def glossary
    # @glossary ||= Rails.cache.fetch("/pages/#{id}/glossary", expires_in: 1.day) do
      # TraitBank::Terms.page_glossary(id)
    # end
    @glossary ||= TraitBank::Terms.page_glossary(id)
  end

  def clear
    clear_caches
    recount
    data # Just to load them
    iucn_status = nil
    iucn_status_key
    geographic_context = nil
    habitats
    has_checked_marine = nil
    is_it_marine?
    has_checked_extinct = nil
    is_it_extinct?
    score_richness
    instance_variables.each do |v|
      # Skip Rails variables:
      next if [
        :@attributes, :@aggregation_cache, :@association_cache, :@readonly,
        :@destroyed, :@marked_for_destruction, :@destroyed_by_association,
        :@new_record, :@txn, :@_start_transaction_state, :@transaction_state,
        :@reflects_state, :@original_raw_attributes
      ].include?(v)
      remove_instance_variable(v)
    end
    reindex
    # TODO: we should also re-index all of the page_contents by checking direct
    # relationships to this page and its children. (I think this is better than
    # descendants; if you want to do an entire tree, that should be another
    # process; this reindex should just check that it's honoring the
    # relationships it has direct influence on.) We may also want to check node
    # relationships, but I'm not sure that's necessary. It's also possible there
    # will be other denormalized relationships to re-build here.
  end

  # NOTE: if you add caches IN THIS CLASS, then add them here:
  def clear_caches
    [
      "/pages/#{id}/glossary"
    ].each do |cache|
      Rails.cache.delete(cache)
    end
  end

  def recount
    [ "page_contents", "media", "articles", "links", "maps",
      "data", "nodes", "vernaculars", "scientific_names", "referents"
    ].each do |field|
      update_column("#{field}_count".to_sym, send(field).count)
    end
    count_species
  end

  def data_toc
    return @data_toc if @data_toc
    data
    @data_toc
  end

  def data_toc_needs_other?
    return @data_toc_needs_other if @data_toc_needs_other
    data
    @data_toc_needs_other
  end

  def grouped_data
    @grouped_data ||= data.group_by { |t| t[:predicate][:uri] }
  end

  def predicates
    @predicates ||= grouped_data.keys.sort do |a,b|
      glossary_names[a] <=> glossary_names[b]
    end
  end

  def object_terms
    @object_terms ||= glossary.keys - predicates
  end

  # NOTE: this is just used for sorting.
  def glossary_names
    @glossary_names ||= begin
      gn = {}
      glossary.each do |uri, hash|
        name = glossary[uri][:name] ? glossary[uri][:name].downcase :
          glossary[uri][:uri].downcase.gsub(/^.*\//, "").humanize.downcase
        gn[uri] = name
      end
      gn
    end
  end
  end