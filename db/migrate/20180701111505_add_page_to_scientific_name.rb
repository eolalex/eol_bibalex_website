class AddPageToScientificName < ActiveRecord::Migration[5.1]
  def change
    add_reference :scientific_names, :page
  end
end
