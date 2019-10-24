class AddMediumIdAndHarvestDbIdToImageInfo < ActiveRecord::Migration[5.1]
  def change
    add_column :image_info, :medium_id, :integer
    add_column :image_info, :harv_db_id, :integer
  end
end
