class Page < ActiveRecord::Base
  has_one :occurrence_map, inverse_of: :page

  has_many :collected_pages
  has_many :collected_pages
  has_many :scientific_names
  has_many :page_contents, class_name: 'PageContent', primary_key: 'id', foreign_key: 'page'
  has_many :vernaculars
  has_many :page_contents
  has_many :media, through: :page_contents, source: :content, source_type: "Medium"
  has_many :articles, through: :page_contents, source: :content, source_type: "Article"
  has_many :pages_node
  has_many :nodes, through: :pages_node

  has_and_belongs_to_many :referents

  belongs_to :node

  validates_uniqueness_of :id

  searchkick word_start: [:scientific_name]
  def search_data
    {
      type: "page",
      id: id,
      scientific_name: scientific_name.downcase
    }
  end

   def scientific_name
    node.try(:scientific_name) || "No Name!"
   end

  def synonyms
    scientific_names.synonym.map { |n| n.canonical_form }
  end

  def occurrence_map?
    occurrence_map
  end
  
  def map?
    occurrence_map? || map_count.size > 0
  end

  def maps
    media.where(subclass: Medium.subclasses[:map])
  end

  def map_count
    Medium.joins("INNER JOIN page_contents ON media.id = page_contents.content_id AND media.subclass=3 AND page_contents.page_id= #{id}")
  end

def media_without_maps
  Medium.joins("INNER JOIN page_contents ON media.id = page_contents.content_id AND media.subclass!=3 AND page_contents.page_id= #{id}")
end

# TRAITS METHODS

  def data(page = 1, per_page = 2000)
    return @data[0..per_page] if @data
    data = TraitBank.by_page(id, page, per_page)
    @data = data
  end

  def glossary
    @glossary ||= TraitBank::Terms.page_glossary(id)
  end

  def grouped_data
    @grouped_data ||= data.group_by {|term| term[:predicate][:uri]}
  end

  def predicates
    @predicates ||= grouped_data.keys.sort
  end

  def object_terms
    @object_terms ||= glossary.keys - predicates
  end
end

