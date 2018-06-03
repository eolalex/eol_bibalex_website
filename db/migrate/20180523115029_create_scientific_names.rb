class CreateScientificNames < ActiveRecord::Migration[5.1]
  def change
    create_table :scientific_names do |t|
      t.references :nodes, foreign_key: true
      t.references :pages, foreign_key: true
      t.references :taxonomic_statuses, foreign_key: true
      t.integer :resource_id
      t.string :canonical_form
      t.string :node_resource_pk
      t.string :italicized
      t.integer :generated_node_id
      t.index ["generated_node_id"], name: "index_scientific_names_on_generated_node_id"

      t.timestamps
    end
  end
end