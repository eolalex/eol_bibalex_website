class AddTimestampsToNodeAncestor < ActiveRecord::Migration[5.1]
  def change
    add_column :node_ancestors, :created_at, :datetime, null: false
    add_column :node_ancestors, :updated_at, :datetime, null: false
  end
end
