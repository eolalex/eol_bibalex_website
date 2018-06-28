class AddIsPreferredToScientificNames < ActiveRecord::Migration[5.1]
  def change
    add_column :scientific_names, :is_preferred, :boolean
  end
end
