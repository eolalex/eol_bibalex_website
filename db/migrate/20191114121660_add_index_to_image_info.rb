class AddIndexToImageInfo < ActiveRecord::Migration[5.1]
  def change
    add_index :image_info, :medium_id
  end
end
