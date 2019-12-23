class CreateRolesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :roles, id: false do |t|
      t.integer :id
      t.string :name
    end
    Role.create name: "regular", id: 0
    Role.create name: "assistant", id: 1
    Role.create name: "full", id: 2
    Role.create name: "master", id: 3
    Role.create name: "admin", id: 4
  end
end
