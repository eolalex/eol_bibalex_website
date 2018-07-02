class AddLocationToMedium < ActiveRecord::Migration[5.1]
  def change
    add_reference :media, :location
  end
end
