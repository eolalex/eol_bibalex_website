class TurnOffAutoIncreamentOfPagesTable < ActiveRecord::Migration[5.1]
  def change
    change_column :pages, :id, :integer
  end
end
