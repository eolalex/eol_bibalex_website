class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string   :name
      t.string   :authorizable_type
      t.integer  :authorizable_id
      t.timestamps
    end
    add_index :roles, [:authorizable_type, :authorizable_id]
  end
end
