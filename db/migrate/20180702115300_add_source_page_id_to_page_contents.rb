class AddSourcePageIdToPageContents < ActiveRecord::Migration[5.1]
  def change
    add_column :page_contents, :source_page_id, :integer, null: false
  end
end
