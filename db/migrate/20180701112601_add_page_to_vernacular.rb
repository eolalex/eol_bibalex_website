class AddPageToVernacular < ActiveRecord::Migration[5.1]
  def change
    add_reference :vernaculars, :page
  end
end
