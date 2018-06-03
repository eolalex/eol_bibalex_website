class CreateVernaculars < ActiveRecord::Migration[5.1]
  def change
    create_table :vernaculars do |t|
      t.string :string
      t.references :languages, foreign_key: true
      t.references :nodes, foreign_key: true
      t.references :pages, foreign_key: true
      t.integer :resource_id
      t.boolean :is_prefered_by_resource
      t.integer :generated_node_id
      t.index ["generated_node_id"], name: "index_vernaculars_on_generated_node_id"

      t.timestamps
    end
  end
end