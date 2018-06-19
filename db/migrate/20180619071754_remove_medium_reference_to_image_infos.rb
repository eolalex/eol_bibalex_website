class RemoveMediumReferenceToImageInfos < ActiveRecord::Migration[5.1]
  def change
    remove_reference :image_info, :medium, index: true, foreign_key: true
  end
end
