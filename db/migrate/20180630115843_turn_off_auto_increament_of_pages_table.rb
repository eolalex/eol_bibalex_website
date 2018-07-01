class TurnOffAutoIncreamentOfPagesTable < ActiveRecord::Migration[5.1]
  def change
    change_column :pages, :id, :integer, { primary: true }
  end
end
