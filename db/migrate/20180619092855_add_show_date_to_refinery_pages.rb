class AddShowDateToRefineryPages < ActiveRecord::Migration[5.1]
  def change
    add_column :refinery_pages, :show_date, :boolean
  end
end
