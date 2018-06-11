class CreateCollectionsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :collections_users do |t|

      t.integer  :user_id,       limit: 4,                 null: false
      t.integer  :collection_id, limit: 4,                 null: false
      t.boolean  :is_manager,              default: false, null: false
      t.datetime :created_at
      t.datetime :updated_at

    end
  end
end
