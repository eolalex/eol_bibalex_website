class AddPageIdToPageContents < ActiveRecord::Migration[5.1]
  def change
    add_reference :page_contents, :page
  end
end
