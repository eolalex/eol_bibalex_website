class Page < ActiveRecord::Base

  validates_uniqueness_of :id
  has_many :collected_pages
  
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  index_name Rails.application.class.parent_name.underscore
  document_type self.name.downcase
  
  settings index: { number_of_shards: 10, "index.blocks.read_only_allow_delete": :null } do
  mapping dynamic: false do
    indexes :scientitfic_name, type: :varchar 
    indexes :suggest, {
      type: 'completion',
      analyzer: 'lowercase',
      search_analyzer: 'lowercase',
      payloads: 'true',
      }
  end
end

  searchkick word_start: [:scientific_name]
  


  has_many :collected_pages

  has_and_belongs_to_many :referents
  belongs_to :node
  has_many :scientific_names
  has_many :page_contents, class_name: 'PageContent', primary_key: 'id', foreign_key: 'page'
  has_many :vernaculars
  has_many :page_contents
  has_many :media, through: :page_contents, source: :content, source_type: "Medium"
  # has_many :maps,class_name: 'Medium', through: :page_contents, source: :content, source_type: "Map"
  has_many :articles, through: :page_contents, source: :content, source_type: "Article"
  has_and_belongs_to_many :referents  
  has_many :pages_node
  has_many :nodes, through: :pages_node
  validates_uniqueness_of :id  
  has_one :occurrence_map, inverse_of: :page
  def search_data
      {
        id: id,
        scientific_name: scientific_name.downcase
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
  
  def map?
    occurrence_map? || map_count.size > 0
  end
  
  def map_count
    Medium.joins("INNER JOIN page_contents ON media.id = page_contents.content_id AND media.subclass=3 AND page_contents.source_page_id= #{id}")
    # PageContent.where(source_page_id: id )
  end
  
  def maps
    media.where(subclass: Medium.subclasses[:map])
  end
  
  def occurrence_map?
    occurrence_map
  end

 # TRAITS METHODS


  def data(page = 1, per = 2000)
    # debugger
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



  def glossary
    @glossary ||= TraitBank::Terms.page_glossary(id)
  end

  def grouped_data
    @grouped_data ||= data.group_by { |t| t[:predicate][:uri] }
  end

  def predicates
    @predicates ||= grouped_data.keys.sort
  end

  def object_terms
    @object_terms ||= glossary.keys - predicates
  end

 
  end
