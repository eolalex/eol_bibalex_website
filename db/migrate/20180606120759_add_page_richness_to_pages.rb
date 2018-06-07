class AddPageRichnessToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :page_richness, :integer
  end
end
