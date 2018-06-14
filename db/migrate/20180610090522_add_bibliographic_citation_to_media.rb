class AddBibliographicCitationToMedia < ActiveRecord::Migration[5.1]
  def change
    add_reference :media, :bibliographic_citation, foreign_key: true
  end
end
