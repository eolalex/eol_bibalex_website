class AddMimeTypeSubclassToMedia < ActiveRecord::Migration[5.1]
  def change
    add_column :media, :mime_type, :integer
    add_column :media, :subclass, :integer
  end
end
