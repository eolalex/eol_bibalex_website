class AddGeneratedNodeIdToNodeAncestors < ActiveRecord::Migration[5.1]
  def change
    add_column :node_ancestors, :node_generated_node_id, :integer
    add_column :node_ancestors, :ancestor_generated_node_id, :integer
  end
end
