class AddBaseUrlAndNameToPageContents < ActiveRecord::Migration[5.1]
  def change
    add_column :page_contents, :base_url, :string
    add_column :page_contents, :name, :string
  end
end
