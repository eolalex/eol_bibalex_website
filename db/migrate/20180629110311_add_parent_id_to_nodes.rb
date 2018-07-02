class AddParentIdToNodes < ActiveRecord::Migration[5.1]
  def change
    add_column :nodes, :parent_id, :integer
  end
end
