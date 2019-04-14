class CreateHarvestTimes < ActiveRecord::Migration[5.1]
  def change

    create_table :harvest_times do |t|
      t.timestamp :last_harvest_time, default: "2018-10-22 14:41:00"
    end
  end
end
