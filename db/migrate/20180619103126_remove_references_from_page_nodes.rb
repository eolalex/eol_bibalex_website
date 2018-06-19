class RemoveReferencesFromPageNodes < ActiveRecord::Migration[5.1]
  def change
    remove_reference :page_nodes, :pages, index: true, foreign_key: true
    remove_reference :page_nodes, :pages, index: true, foreign_key: true
  end
end
