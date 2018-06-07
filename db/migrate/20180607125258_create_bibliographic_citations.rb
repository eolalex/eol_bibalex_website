class CreateBibliographicCitations < ActiveRecord::Migration[5.1]
  def change
    create_table :bibliographic_citations do |t|
      t.integer :resource_id
      t.text :body

      t.timestamps
    end
  end
end
