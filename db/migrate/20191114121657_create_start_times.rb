class CreateStartTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :start_times do |t|
      t.string :start_time_string

      t.timestamps
    end
  end
end
