class AddNodeToScientificName < ActiveRecord::Migration[5.1]
  def change
    add_reference :scientific_names, :node
  end
end
