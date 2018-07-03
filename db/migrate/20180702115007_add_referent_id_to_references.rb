class AddReferentIdToReferences < ActiveRecord::Migration[5.1]
  def change
    add_column :references, :referent_id, :integer
  end
end
