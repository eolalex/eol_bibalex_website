class AddReferenceseFromArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :language, foreign_key: true
    add_reference :articles, :license, foreign_key: true
    add_reference :articles, :location, foreign_key: true
  end
end
