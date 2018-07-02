class RemoveRanksReferenceFromNodes < ActiveRecord::Migration[5.1]
  def change

    remove_reference :nodes, :ranks, index: true, foreign_key: true

  end
end
