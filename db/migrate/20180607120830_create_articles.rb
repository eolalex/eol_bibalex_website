class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :owner
      t.integer :resource_id
      t.string :guid
      t.string :resource_pk
      t.references :languages, foreign_key: true
      t.references :licenses, foreign_key: true
      t.references :locations, foreign_key: false
      t.integer :mime_type
      t.string :name
      t.string :rights_statement
      t.string :source_url

      t.timestamps
    end
  end
end
