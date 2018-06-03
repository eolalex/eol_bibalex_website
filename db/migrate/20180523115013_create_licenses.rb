class CreateLicenses < ActiveRecord::Migration[5.1]
  def change
    create_table :licenses do |t|
      t.string :source_url
      t.string :name

      t.timestamps
    end
  end
end
