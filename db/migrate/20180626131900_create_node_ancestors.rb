class CreateNodeAncestors < ActiveRecord::Migration[5.1]
  def change
     create_table :node_ancestors do |t|
      t.integer :resource_id, null: false
      t.integer :node_id, index: true, comment: "the id of the descendant node"
      t.integer :ancestor_id, index: true, comment: "the id of the node which is an ancestor"
      t.string :node_resource_pk, index: true
      t.string :ancestor_resource_pk, index: true
      t.integer :depth
    end
    
    add_index :node_ancestors, :resource_id

  end
end
