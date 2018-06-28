class AddAttributesToPageContents < ActiveRecord::Migration[5.1]
  def change
    add_column :page_contents, :trust, :integer
    add_column :page_contents, :is_incorrect, :boolean
    add_column :page_contents, :is_misidentified, :boolean
    add_column :page_contents, :is_hidden, :boolean
    add_column :page_contents, :is_duplicate, :boolean
  end
end
