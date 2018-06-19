class RemoveReferencesFromPages < ActiveRecord::Migration[5.1]
  def change
    remove_reference :pages, :native_node, foreign_key: { to_table: :nodes }
    remove_reference :pages, :medium, index: true, foreign_key: true
  end
end
