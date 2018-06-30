class AddPageIdToNodes < ActiveRecord::Migration[5.1]
  def change
    add_reference :nodes, :page, foreign_key: true
  end
end
