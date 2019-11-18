class AddUniqueIndexToNodeAncestorsFlattened < ActiveRecord::Migration[5.1]
  def change
    add_index :node_ancestors_flatteneds, :generated_node_id, unique: true
  end
end
