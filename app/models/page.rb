class Page < ApplicationRecord
  searchkick word_start: [:scientific_name]
  belongs_to :native_node, class_name: "Node"
  belongs_to :medium, inverse_of: :pages
  
  def search_data
      {
        scientific_name: scientific_name
      }
  end
  
  def scientific_name
    native_node.try(:scientific_name) || "No Name!"
  end
end
