class RemoveReferencesFromPages < ActiveRecord::Migration[5.1]
  def change
    remove_reference :pages, :native_node, foreign_key: { to_table: :nodes }
  end
end
