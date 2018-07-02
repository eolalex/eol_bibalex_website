class RemoveReferencesFromPageContents < ActiveRecord::Migration[5.1]
  def change
    remove_reference :page_contents, :pages, index: true, foreign_key: true
  end
end
