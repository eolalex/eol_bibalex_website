class CreateReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :references do |t|
      t.integer :parent_id
      t.string :parent_type
      t.index ["parent_type"], name: "index_references_on_parent_type"
      t.references :referents, foreign_key: true
      t.integer :resource_id

      t.timestamps
    end
  end
end