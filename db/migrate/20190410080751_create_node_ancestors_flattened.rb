class CreateNodeAncestorsFlattened < ActiveRecord::Migration[5.1]
  def change
    create_table :node_ancestors_flatteneds do |t|
      t.integer :generated_node_id, null: false
      t.integer :resource_id, null: false
      t.string :node_ancestors_ids
      t.timestamps
    end
  end
end
