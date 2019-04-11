class CreateNodeDirectParent < ActiveRecord::Migration[5.1]
  def change
    create_table :node_direct_parents do |t|
      t.integer :generated_node_id, null: false
      t.integer :resource_id, null: false
      t.integer :direct_parent_id
      t.timestamps
    end
  end
end
