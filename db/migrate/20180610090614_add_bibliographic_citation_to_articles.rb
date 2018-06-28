class AddBibliographicCitationToArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :bibliographic_citation, foreign_key: true
  end
end
