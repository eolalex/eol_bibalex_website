class RemoveReferencesFromScientificNames < ActiveRecord::Migration[5.1]
  def change
    remove_reference :scientific_names, :nodes, index: true, foreign_key: true
    remove_reference :scientific_names, :pages, index: true, foreign_key: true
    remove_reference :scientific_names, :taxonomic_statuses, index: true, foreign_key: true
  end
end
