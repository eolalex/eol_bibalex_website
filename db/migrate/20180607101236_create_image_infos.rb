class CreateImageInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :image_info do |t|
      t.integer :resource_id
      t.string :original_size
      t.string :large_size
      t.string :medium_size
      t.string :small_size
      t.decimal :crop_x
      t.decimal :crop_y
      t.decimal :crop_w
      t.string :resource_pk
      t.references :medium, foreign_key: true

      t.timestamps
    end
  end
end
