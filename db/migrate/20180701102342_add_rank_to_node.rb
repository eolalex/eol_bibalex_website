class AddRankToNode < ActiveRecord::Migration[5.1]
  def change
    add_reference :nodes, :rank
  end
end
