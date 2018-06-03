class CreateAttributions < ActiveRecord::Migration[5.1]
  def change
    create_table :attributions do |t|
      t.integer :content_id
      t.string :content_type
      t.index ["content_type"], name: "index_attributions_on_content_type"
      t.string :role_name
      t.text :value
      t.string :url
      t.integer :resource_id
      t.string :resource_pk
      t.string :content_resource_fk

      t.timestamps
    end
  end
end