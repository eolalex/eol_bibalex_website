class CreateCollectedPages < ActiveRecord::Migration[5.1]
  def change
    create_table :collected_pages do |t|
      t.references  :collection, limit: 4,     null: false, foreign_key: true
      t.references  :page,       limit: 4,     null: false, foreign_key: true
      t.integer  :position,      limit: 4
      t.datetime :created_at,                  null: false
      t.datetime :updated_at,                  null: false
      t.text     :annotation,    limit: 65535

      t.timestamps
    end

    add_index(:collected_pages, [:collection_id, :page_id],
      name: "enforce_unique_pairs", unique: true)

    create_join_table :collected_pages, :media do |t|
      t.index :collected_page_id
      t.integer :position
    end

    # TODO: remove these guys, they are a distraction until we need them.
    create_join_table :collected_pages, :articles do |t|
      t.index :collected_page_id
      t.integer :position
    end

    create_join_table :collected_pages, :links do |t|
      t.index :collected_page_id
      t.integer :position
    end
  end
end
