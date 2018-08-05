class CreateOccurrencePageMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :occurrence_page_mappings do |t|
      t.integer :resource_id
      t.string :occurrence_id
      t.integer :page_id
      t.timestamps
    end
  end
end
