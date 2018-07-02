class RemovePageFromNode < ActiveRecord::Migration[5.1]
  def change
    remove_reference :nodes, :page, index: true, foreign_key: true
  end
end
