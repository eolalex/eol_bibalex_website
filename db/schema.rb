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

ActiveRecord::Schema.define(version: 20181106090034) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "owner"
    t.integer "resource_id"
    t.string "guid"
    t.string "resource_pk"
    t.integer "mime_type"
    t.string "name"
    t.string "rights_statement"
    t.string "source_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bibliographic_citation_id"
    t.bigint "language_id"
    t.bigint "license_id"
    t.bigint "location_id"
    t.index ["bibliographic_citation_id"], name: "index_articles_on_bibliographic_citation_id"
    t.index ["language_id"], name: "index_articles_on_language_id"
    t.index ["license_id"], name: "index_articles_on_license_id"
    t.index ["location_id"], name: "index_articles_on_location_id"
  end

  create_table "articles_collected_pages", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "collected_page_id", null: false
    t.bigint "article_id", null: false
    t.integer "position"
    t.index ["collected_page_id"], name: "index_articles_collected_pages_on_collected_page_id"
  end

  create_table "attributions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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

  create_table "bibliographic_citations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "resource_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collected_pages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "collection_id", null: false
    t.bigint "page_id", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "annotation"
    t.index ["collection_id", "page_id"], name: "enforce_unique_pairs", unique: true
    t.index ["collection_id"], name: "index_collected_pages_on_collection_id"
    t.index ["page_id"], name: "index_collected_pages_on_page_id"
  end

  create_table "collected_pages_links", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "collected_page_id", null: false
    t.bigint "link_id", null: false
    t.integer "position"
    t.index ["collected_page_id"], name: "index_collected_pages_links_on_collected_page_id"
  end

  create_table "collected_pages_media", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "collected_page_id", null: false
    t.bigint "medium_id", null: false
    t.integer "position"
    t.index ["collected_page_id"], name: "index_collected_pages_media_on_collected_page_id"
  end

  create_table "collections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "collected_pages_count", default: 0
    t.integer "collection_associations_count", default: 0
    t.integer "collection_type", default: 0
    t.integer "default_sort", default: 0
  end

  create_table "collections_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "collection_id", null: false
    t.integer "user_id", null: false
    t.boolean "is_manager", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_collections_users_on_collection_id"
  end

  create_table "content_partner_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.integer "content_partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_content_partner_users_on_user_id"
  end

  create_table "content_sections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "section_id"
    t.integer "content_id"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_content_sections_on_section_id"
  end

  create_table "image_info", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "resource_id"
    t.string "original_size"
    t.string "large_size"
    t.string "medium_size"
    t.string "small_size"
    t.decimal "crop_x", precision: 10
    t.decimal "crop_y", precision: 10
    t.decimal "crop_w", precision: 10
    t.string "resource_pk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group"
  end

  create_table "licenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "source_url"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "resource_id"
    t.string "location"
    t.decimal "longitude", precision: 10
    t.decimal "latitude", precision: 10
    t.decimal "altitude", precision: 10
    t.text "spatial_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "format"
    t.text "description"
    t.text "owner"
    t.integer "resource_id"
    t.string "guid"
    t.string "resource_pk"
    t.string "source_page_url"
    t.string "base_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mime_type"
    t.integer "subclass"
    t.string "name"
    t.string "rights_statement"
    t.string "source_url"
    t.bigint "bibliographic_citation_id"
    t.bigint "language_id"
    t.bigint "license_id"
    t.bigint "location_id"
    t.index ["bibliographic_citation_id"], name: "index_media_on_bibliographic_citation_id"
    t.index ["language_id"], name: "index_media_on_language_id"
    t.index ["license_id"], name: "index_media_on_license_id"
    t.index ["location_id"], name: "index_media_on_location_id"
  end

  create_table "node_ancestors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "resource_id", null: false
    t.integer "node_id", comment: "the id of the descendant node"
    t.integer "ancestor_id", comment: "the id of the node which is an ancestor"
    t.string "node_resource_pk"
    t.string "ancestor_resource_pk"
    t.integer "depth"
    t.integer "node_generated_node_id"
    t.integer "ancestor_generated_node_id"
    t.index ["ancestor_id"], name: "index_node_ancestors_on_ancestor_id"
    t.index ["ancestor_resource_pk"], name: "index_node_ancestors_on_ancestor_resource_pk"
    t.index ["node_id"], name: "index_node_ancestors_on_node_id"
    t.index ["node_resource_pk"], name: "index_node_ancestors_on_node_resource_pk"
    t.index ["resource_id"], name: "index_node_ancestors_on_resource_id"
  end

  create_table "nodes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "resource_id"
    t.string "scientific_name"
    t.string "canonical_form"
    t.integer "generated_node_id"
    t.string "resource_pk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.bigint "rank_id"
    t.index ["generated_node_id"], name: "index_nodes_on_generated_node_id"
    t.index ["rank_id"], name: "index_nodes_on_rank_id"
  end

  create_table "occurrence_page_mappings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "resource_id"
    t.string "occurrence_id"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "resource_id"
    t.string "content_type"
    t.integer "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trust"
    t.boolean "is_incorrect"
    t.boolean "is_misidentified"
    t.boolean "is_hidden"
    t.boolean "is_duplicate"
    t.bigint "page_id"
    t.integer "source_page_id", null: false
    t.index ["content_type"], name: "index_page_contents_on_content_type"
    t.index ["page_id"], name: "index_page_contents_on_page_id"
  end

  create_table "pages", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "page_richness"
    t.bigint "node_id"
  end

  create_table "pages_nodes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "page_id"
    t.bigint "node_id"
    t.boolean "is_native"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_pages_nodes_on_node_id"
    t.index ["page_id"], name: "index_pages_nodes_on_page_id"
  end

  create_table "pages_referents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "page_id"
    t.integer "referent_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "references", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "parent_id"
    t.string "parent_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "referent_id"
    t.index ["parent_type"], name: "index_references_on_parent_type"
  end

  create_table "referents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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

  create_table "refinery_image_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "refinery_image_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_alt"
    t.string "image_title"
    t.index ["locale"], name: "index_refinery_image_translations_on_locale"
    t.index ["refinery_image_id"], name: "index_refinery_image_translations_on_refinery_image_id"
  end

  create_table "refinery_images", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image_mime_type"
    t.string "image_name"
    t.integer "image_size"
    t.integer "image_width"
    t.integer "image_height"
    t.string "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_page_part_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "refinery_page_part_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.index ["locale"], name: "index_refinery_page_part_translations_on_locale"
    t.index ["refinery_page_part_id"], name: "index_refinery_page_part_translations_on_refinery_page_part_id"
  end

  create_table "refinery_page_parts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "refinery_page_id"
    t.string "slug"
    t.integer "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "title"
    t.index ["id"], name: "index_refinery_page_parts_on_id"
    t.index ["refinery_page_id"], name: "index_refinery_page_parts_on_refinery_page_id"
  end

  create_table "refinery_page_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "refinery_page_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "custom_slug"
    t.string "menu_title"
    t.string "slug"
    t.index ["locale"], name: "index_refinery_page_translations_on_locale"
    t.index ["refinery_page_id"], name: "index_refinery_page_translations_on_refinery_page_id"
  end

  create_table "refinery_pages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "parent_id"
    t.string "path"
    t.boolean "show_in_menu", default: true
    t.string "link_url"
    t.string "menu_match"
    t.boolean "deletable", default: true
    t.boolean "draft", default: false
    t.boolean "skip_to_first_child", default: false
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.string "view_template"
    t.string "layout_template"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "children_count", default: 0, null: false
    t.boolean "show_date"
    t.index ["depth"], name: "index_refinery_pages_on_depth"
    t.index ["id"], name: "index_refinery_pages_on_id"
    t.index ["lft"], name: "index_refinery_pages_on_lft"
    t.index ["parent_id"], name: "index_refinery_pages_on_parent_id"
    t.index ["rgt"], name: "index_refinery_pages_on_rgt"
  end

  create_table "refinery_resource_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "refinery_resource_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "resource_title"
    t.index ["locale"], name: "index_refinery_resource_translations_on_locale"
    t.index ["refinery_resource_id"], name: "index_refinery_resource_translations_on_refinery_resource_id"
  end

  create_table "refinery_resources", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "file_mime_type"
    t.string "file_name"
    t.integer "file_size"
    t.string "file_uid"
    t.string "file_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scientific_names", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "resource_id"
    t.string "canonical_form"
    t.string "node_resource_pk"
    t.string "italicized"
    t.integer "generated_node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_preferred"
    t.bigint "node_id"
    t.bigint "page_id"
    t.bigint "taxonomic_status_id"
    t.index ["generated_node_id"], name: "index_scientific_names_on_generated_node_id"
    t.index ["node_id"], name: "index_scientific_names_on_node_id"
    t.index ["page_id"], name: "index_scientific_names_on_page_id"
    t.index ["taxonomic_status_id"], name: "index_scientific_names_on_taxonomic_status_id"
  end

  create_table "sections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "parent_id"
    t.integer "position"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seo_meta", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "seo_meta_id"
    t.string "seo_meta_type"
    t.string "browser_title"
    t.text "meta_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_seo_meta_on_id"
    t.index ["seo_meta_id", "seo_meta_type"], name: "id_type_index_on_seo_meta"
  end

  create_table "taxonomic_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.boolean "is_preferred"
    t.boolean "is_problematic"
    t.boolean "is_alternative_preferred"
    t.boolean "can_merge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_providers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_providers_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.string "username"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "vernaculars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "string"
    t.integer "resource_id"
    t.boolean "is_prefered_by_resource"
    t.integer "generated_node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "node_id"
    t.bigint "page_id"
    t.bigint "language_id"
    t.index ["generated_node_id"], name: "index_vernaculars_on_generated_node_id"
    t.index ["language_id"], name: "index_vernaculars_on_language_id"
    t.index ["node_id"], name: "index_vernaculars_on_node_id"
    t.index ["page_id"], name: "index_vernaculars_on_page_id"
  end

  add_foreign_key "articles", "bibliographic_citations"
  add_foreign_key "articles", "languages"
  add_foreign_key "articles", "licenses"
  add_foreign_key "articles", "locations"
  add_foreign_key "collected_pages", "collections"
  add_foreign_key "content_sections", "sections"
  add_foreign_key "links", "languages", column: "languages_id"
  add_foreign_key "media", "bibliographic_citations"
end
