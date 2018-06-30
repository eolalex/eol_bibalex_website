class AddCollectionsToUsers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :collections, :users do |t|
      t.index :collection_id
      t.integer :user_id, null: false
      t.boolean :is_manager, default: 0
      t.timestamps
    end

  end
end
