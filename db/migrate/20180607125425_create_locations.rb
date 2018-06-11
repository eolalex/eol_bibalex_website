class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.integer :resource_id
      t.string :location
      t.decimal :longitude
      t.decimal :latitude
      t.decimal :altitude
      t.text :spatial_location

      t.timestamps
    end
  end
end
