class CreatePagesNodes < ActiveRecord::Migration[5.1]
  def change
    create_table :pages_nodes do |t|
      t.references :page, foreign_key: true
      t.references :node, foreign_key: true
      t.boolean :is_native

      t.timestamps
    end
  end
end