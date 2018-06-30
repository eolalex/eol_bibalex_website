class Page < ApplicationRecord

  has_many :collected_pages, inverse_of: :page
  searchkick word_start: [:scientific_name]
  belongs_to :native_node, class_name: "Node"
  belongs_to :medium, inverse_of: :pages
  has_many :scientific_names, class_name: 'ScientificName', primary_key: 'id', foreign_key: 'pages'
  has_many :page_contents, class_name: 'PageContent', primary_key: 'id', foreign_key: 'pages'
  has_many :media, through: :page_contents, source: :content, source_type: "Medium"
  has_many :nodes, inverse_of: :page
  def search_data
      {
        id: id,
        scientific_name: scientific_name
      }
  end
  
  def scientific_name
    native_node.try(:scientific_name) || "No Name!"
  end
  
  def synonyms
    scientific_names.synonym.map { |n| n.canonical_form }
  end
  
  def maps
    media.where(subclass: Medium.subclasses[:map])
  end
end
