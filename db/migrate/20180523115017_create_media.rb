class CreateMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :media do |t|
      t.integer :format
      t.text :description
      t.text :owner
      t.integer :resource_id
      t.string :guid
      t.string :resource_pk
      t.string :source_page_url
      t.references :languages, foreign_key: true
      t.references :licenses, foreign_key: true
      t.references :locations, foreign_key: false
      t.string :base_url

      t.timestamps
    end
  end
end