class RemoveReferenceseFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_reference :articles, :languages, index: true, foreign_key: true
    remove_reference :articles, :licenses, index: true, foreign_key: true
    remove_reference :articles, :locations
  end
end
