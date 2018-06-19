class RemoveRanksReferenceFromNodes < ActiveRecord::Migration[5.1]
  def change
    remove_reference :nodes, :ranks
  end
end
