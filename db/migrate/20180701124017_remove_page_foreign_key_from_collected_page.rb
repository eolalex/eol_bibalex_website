class RemovePageForeignKeyFromCollectedPage < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :collected_pages, name: "fk_rails_b1c4805839"
  end
end
