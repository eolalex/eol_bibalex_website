class AddIndexToNodeAncestorsFlattened < ActiveRecord::Migration[5.1]
  def change
    add_index :node_ancestors_flatteneds, [:generated_node_id, :resource_id], :name => 'ancestors_index'
  end
end
