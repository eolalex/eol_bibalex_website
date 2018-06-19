class RemoveReferenceseFromMedia < ActiveRecord::Migration[5.1]
  def change
    remove_reference :media, :languages, index: true, foreign_key: true
    remove_reference :media, :licenses, index: true, foreign_key: true
    remove_reference :media, :locations
  end
end
