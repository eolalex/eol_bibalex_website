class RemoveForeignKeysFromPagesNodes < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :pages_nodes, name: "fk_rails_b647aef1e0"
    remove_foreign_key :pages_nodes, name: "fk_rails_da88b01f79"
  end
end
