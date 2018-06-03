class CreateNodes < ActiveRecord::Migration[5.1]
  def change
    create_table :nodes do |t|
      t.integer :resource_id
      t.references :ranks, foreign_key: true
      t.string :scientific_name
      t.string :canonical_form
      t.integer :generated_node_id
      t.index ["generated_node_id"], name: "index_nodes_on_generated_node_id"
      t.string :resource_pk

      t.timestamps
    end
  end
end