class CreatePagesReferents < ActiveRecord::Migration[5.1]
  def change
    create_table :pages_referents do |t|
      t.integer :page_id
      t.integer :referent_id
      t.integer :position
      t.timestamps
    end
  end
end
