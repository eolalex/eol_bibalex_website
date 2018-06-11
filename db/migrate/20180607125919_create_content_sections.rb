class CreateContentSections < ActiveRecord::Migration[5.1]
  def change
    create_table :content_sections do |t|
      t.references :section, foreign_key: true
      t.integer :content_id
      t.string :content_type

      t.timestamps
    end
  end
end
