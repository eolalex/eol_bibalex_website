class CreateReferents < ActiveRecord::Migration[5.1]
  def change
    create_table :referents do |t|
      t.string :primary_title
      t.string :secondary_title
      t.integer :pages
      t.integer :page_start
      t.integer :page_end
      t.string :volume
      t.string :editor
      t.string :publisher
      t.string :authors_list
      t.string :editors_list
      t.datetime :date_created
      t.string :doi
      t.text :body
      t.integer :resource_id
      t.string :resource_pk

      t.timestamps
    end
  end
end