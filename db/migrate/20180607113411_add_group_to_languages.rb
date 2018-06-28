class AddGroupToLanguages < ActiveRecord::Migration[5.1]
  def change
    add_column :languages, :group, :string
  end
end
