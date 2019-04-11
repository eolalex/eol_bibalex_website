class AddIndexToNodeDirectParent < ActiveRecord::Migration[5.1]
  def change
    add_index :node_direct_parents, [:generated_node_id, :resource_id], :name => 'parent_index'
    add_index :node_direct_parents, [:direct_parent_id, :resource_id], :name => 'child_index'
  end
end
