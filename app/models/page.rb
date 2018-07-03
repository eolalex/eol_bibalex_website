class Page < ActiveRecord::Base

  has_many :collected_pages
  searchkick word_start: [:scientific_name]

  has_and_belongs_to_many :referents
  belongs_to :native_node, class_name: "Node"
  belongs_to :medium, inverse_of: :pages
  has_many :scientific_names, class_name: 'ScientificName',  foreign_key: 'pages_id'
  has_many :vernaculars,  class_name: "Vernacular", foreign_key: 'pages_id'
  has_many :page_contents, class_name: 'PageContent', primary_key: 'id', foreign_key: 'pages'
  has_many :media, through: :page_contents, source: :content, source_type: "Medium"
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
end
