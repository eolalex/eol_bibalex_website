class CreateHarvestImageTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :harvest_image_times do |t|
      t.datetime :last_time

      t.timestamps
    end
  end
end
