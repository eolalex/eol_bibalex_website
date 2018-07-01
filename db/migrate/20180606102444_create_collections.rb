class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :collected_pages_count, limit: 4, default: 0
      t.integer :collection_associations_count, limit: 4,     default: 0
      t.integer :collection_type, limit: 4,     default: 0
      t.integer :default_sort,    limit: 4,     default: 0
      t.timestamps
    end
  end
end