class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.integer :parent_id
      t.integer :position
      t.string :name

      t.timestamps
    end
  end
end
