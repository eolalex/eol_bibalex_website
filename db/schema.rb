# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180607125919) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "owner"
    t.integer "resource_id"
    t.string "guid"
    t.string "resource_pk"
    t.bigint "languages_id"
    t.bigint "licenses_id"
    t.bigint "locations_id"
    t.integer "mime_type"
    t.string "name"
    t.string "rights_statement"
    t.string "source_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["languages_id"], name: "index_articles_on_languages_id"
    t.index ["licenses_id"], name: "index_articles_on_licenses_id"
    t.index ["locations_id"], name: "index_articles_on_locations_id"
  end

  create_table "attributions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "content_id"
    t.string "content_type"
    t.string "role_name"
    t.text "value"
    t.string "url"
    t.integer "resource_id"
    t.string "resource_pk"
    t.string "content_resource_fk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_type"], name: "index_attributions_on_content_type"
  end

  create_table "content_sections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "section_id"
    t.integer "content_id"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_content_sections_on_section_id"
  end
  
  create_table "bibliographic_citations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "resource_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "image_info", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "resource_id"
    t.string "original_size"
    t.string "large_size"
    t.string "medium_size"
    t.string "small_size"
    t.decimal "crop_x", precision: 10
    t.decimal "crop_y", precision: 10
    t.decimal "crop_w", precision: 10
    t.string "resource_pk"
    t.bigint "medium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medium_id"], name: "index_image_info_on_medium_id"
  end

  create_table "languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group"
  end

  create_table "licenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "source_url"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "description"
    t.integer "resource_id"
    t.string "guid"
    t.string "resource_pk"
    t.bigint "languages_id"
    t.string "name"
    t.string "rights_statement"
    t.string "source_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["languages_id"], name: "index_links_on_languages_id"
  end
  
  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "resource_id"
    t.string "location"
    t.decimal "longitude", precision: 10
    t.decimal "latitude", precision: 10
    t.decimal "altitude", precision: 10
    t.text "spatial_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "format"
    t.text "description"
    t.text "owner"
    t.integer "resource_id"
    t.string "guid"
    t.string "resource_pk"
    t.string "source_page_url"
    t.bigint "languages_id"
    t.bigint "licenses_id"
    t.bigint "locations_id"
    t.string "base_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mime_type"
    t.integer "subclass"
    t.string "name"
    t.string "rights_statement"
    t.string "source_url"
    t.index ["languages_id"], name: "index_media_on_languages_id"
    t.index ["licenses_id"], name: "index_media_on_licenses_id"
    t.index ["locations_id"], name: "index_media_on_locations_id"
  end

  create_table "nodes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "resource_id"
    t.bigint "ranks_id"
    t.string "scientific_name"
    t.string "canonical_form"
    t.integer "generated_node_id"
    t.string "resource_pk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["generated_node_id"], name: "index_nodes_on_generated_node_id"
    t.index ["ranks_id"], name: "index_nodes_on_ranks_id"
  end

  create_table "page_contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "resource_id"
    t.string "content_type"
    t.integer "content_id"
    t.bigint "pages_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trust"
    t.boolean "is_incorrect"
    t.boolean "is_misidentified"
    t.boolean "is_hidden"
    t.boolean "is_duplicate"
    t.index ["content_type"], name: "index_page_contents_on_content_type"
    t.index ["pages_id"], name: "index_page_contents_on_pages_id"
  end

  create_table "pages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "medium_id"
    t.bigint "native_node_id"
    t.integer "page_richness"
    t.index ["medium_id"], name: "index_pages_on_medium_id"
    t.index ["native_node_id"], name: "index_pages_on_native_node_id"
  end

  create_table "pages_nodes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "page_id"
    t.bigint "node_id"
    t.boolean "is_native"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_pages_nodes_on_node_id"
    t.index ["page_id"], name: "index_pages_nodes_on_page_id"
  end

  create_table "ranks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "references", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "parent_id"
    t.string "parent_type"
    t.bigint "referents_id"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_type"], name: "index_references_on_parent_type"
    t.index ["referents_id"], name: "index_references_on_referents_id"
  end

  create_table "referents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "primary_title"
    t.string "secondary_title"
    t.integer "pages"
    t.integer "page_start"
    t.integer "page_end"
    t.string "volume"
    t.string "editor"
    t.string "publisher"
    t.string "authors_list"
    t.string "editors_list"
    t.datetime "date_created"
    t.string "doi"
    t.text "body"
    t.integer "resource_id"
    t.string "resource_pk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scientific_names", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "nodes_id"
    t.bigint "pages_id"
    t.bigint "taxonomic_statuses_id"
    t.integer "resource_id"
    t.string "canonical_form"
    t.string "node_resource_pk"
    t.string "italicized"
    t.integer "generated_node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_preferred"
    t.index ["generated_node_id"], name: "index_scientific_names_on_generated_node_id"
    t.index ["nodes_id"], name: "index_scientific_names_on_nodes_id"
    t.index ["pages_id"], name: "index_scientific_names_on_pages_id"
    t.index ["taxonomic_statuses_id"], name: "index_scientific_names_on_taxonomic_statuses_id"
  end

  create_table "sections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "parent_id"
    t.integer "position"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxonomic_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.boolean "is_preferred"
    t.boolean "is_problematic"
    t.boolean "is_alternative_preferred"
    t.boolean "can_merge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vernaculars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "string"
    t.bigint "languages_id"
    t.bigint "nodes_id"
    t.bigint "pages_id"
    t.integer "resource_id"
    t.boolean "is_prefered_by_resource"
    t.integer "generated_node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["generated_node_id"], name: "index_vernaculars_on_generated_node_id"
    t.index ["languages_id"], name: "index_vernaculars_on_languages_id"
    t.index ["nodes_id"], name: "index_vernaculars_on_nodes_id"
    t.index ["pages_id"], name: "index_vernaculars_on_pages_id"
  end

  add_foreign_key "articles", "languages", column: "languages_id"
  add_foreign_key "articles", "licenses", column: "licenses_id"
  add_foreign_key "content_sections", "sections"
  add_foreign_key "image_info", "media"
  add_foreign_key "links", "languages", column: "languages_id"
  add_foreign_key "image_info", "media"
  add_foreign_key "media", "languages", column: "languages_id"
  add_foreign_key "media", "licenses", column: "licenses_id"
  add_foreign_key "nodes", "ranks", column: "ranks_id"
  add_foreign_key "page_contents", "pages", column: "pages_id"
  add_foreign_key "pages", "media"
  add_foreign_key "pages", "nodes", column: "native_node_id"
  add_foreign_key "pages_nodes", "nodes"
  add_foreign_key "pages_nodes", "pages"
  add_foreign_key "references", "referents", column: "referents_id"
  add_foreign_key "scientific_names", "nodes", column: "nodes_id"
  add_foreign_key "scientific_names", "pages", column: "pages_id"
  add_foreign_key "scientific_names", "taxonomic_statuses", column: "taxonomic_statuses_id"
  add_foreign_key "vernaculars", "languages", column: "languages_id"
  add_foreign_key "vernaculars", "nodes", column: "nodes_id"
  add_foreign_key "vernaculars", "pages", column: "pages_id"
end
