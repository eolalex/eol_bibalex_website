class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.text :description
      t.integer :resource_id
      t.string :guid
      t.string :resource_pk
      t.references :languages, foreign_key: true
      t.string :name
      t.string :rights_statement
      t.string :source_url

      t.timestamps
    end
  end
end
