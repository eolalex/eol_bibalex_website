class CreatePageContents < ActiveRecord::Migration[5.1]
  def change
    create_table :page_contents do |t|
      t.integer :resource_id
      t.string :content_type
      t.index ["content_type"], name: "index_page_contents_on_content_type"
      t.integer :content_id
      t.references :pages, foreign_key: true

      t.timestamps
    end
  end
end