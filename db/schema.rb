# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_19_202507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "zip_code"
    t.string "street"
    t.integer "addressable_id"
    t.string "addressable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "centrals", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "centrals_users", id: false, force: :cascade do |t|
    t.bigint "central_id", null: false
    t.bigint "user_id", null: false
    t.index ["central_id"], name: "index_centrals_users_on_central_id"
    t.index ["user_id"], name: "index_centrals_users_on_user_id"
  end

  create_table "components", force: :cascade do |t|
    t.string "name"
    t.decimal "cost", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "central_id"
    t.index ["central_id"], name: "index_components_on_central_id"
  end

  create_table "components_products", id: false, force: :cascade do |t|
    t.bigint "component_id", null: false
    t.bigint "product_id", null: false
    t.index ["component_id"], name: "index_components_products_on_component_id"
    t.index ["product_id"], name: "index_components_products_on_product_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: false
    t.bigint "central_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["central_id"], name: "index_menus_on_central_id"
  end

  create_table "menus_products", id: false, force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.bigint "product_id", null: false
    t.index ["menu_id"], name: "index_menus_products_on_menu_id"
    t.index ["product_id"], name: "index_menus_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "total_price", precision: 10, scale: 2
    t.decimal "profit", precision: 10, scale: 2
    t.boolean "issued", default: false
    t.bigint "store_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_orders_on_store_id"
  end

  create_table "orders_products", id: false, force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.index ["order_id"], name: "index_orders_products_on_order_id"
    t.index ["product_id"], name: "index_orders_products_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 8, scale: 2
    t.bigint "central_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["central_id"], name: "index_products_on_central_id"
  end

  create_table "quantities", force: :cascade do |t|
    t.integer "component_id"
    t.integer "warehouse_id"
    t.integer "quantity", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stores", force: :cascade do |t|
    t.bigint "central_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["central_id"], name: "index_stores_on_central_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "surname"
    t.string "phone_number"
  end

  create_table "warehouses", force: :cascade do |t|
    t.integer "warehousable_id"
    t.string "warehousable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["warehousable_type", "warehousable_id"], name: "index_warehouses_on_warehousable_type_and_warehousable_id"
  end

  create_table "workers", force: :cascade do |t|
    t.integer "store_id"
    t.integer "user_id"
    t.boolean "manager", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
