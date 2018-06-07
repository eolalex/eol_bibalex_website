class Page < ApplicationRecord
  searchkick word_start: [:scientific_name]
  belongs_to :native_node, class_name: "Node"
  belongs_to :medium, inverse_of: :pages
  
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
end
