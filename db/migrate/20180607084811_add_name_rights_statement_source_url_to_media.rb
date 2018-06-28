class AddNameRightsStatementSourceUrlToMedia < ActiveRecord::Migration[5.1]
  def change
    add_column :media, :name, :string
    add_column :media, :rights_statement, :string
    add_column :media, :source_url, :string
  end
end
