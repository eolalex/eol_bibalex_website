class RemoveReferencesFromVernaculars < ActiveRecord::Migration[5.1]
  def change
    remove_reference :vernaculars, :nodes, index: true, foreign_key: true
    remove_reference :vernaculars, :pages, index: true, foreign_key: true
    remove_reference :vernaculars, :languages, index: true, foreign_key: true
  end
end
