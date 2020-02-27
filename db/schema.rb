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

ActiveRecord::Schema.define(version: 2020_02_25_071109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "sub_title"
    t.string "category"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "description"
    t.string "event_url"
    t.boolean "marked_as_deleted", default: false
    t.datetime "last_crawled_at"
    t.bigint "web_resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["web_resource_id", "event_url"], name: "index_events_on_web_resource_id_and_event_url", unique: true
    t.index ["web_resource_id"], name: "index_events_on_web_resource_id"
  end

  create_table "parsers", force: :cascade do |t|
    t.string "host"
    t.string "path"
    t.bigint "web_resource_id"
    t.string "event_list_container"
    t.string "title"
    t.string "sub_title"
    t.string "category"
    t.string "start_time"
    t.string "end_time"
    t.string "description"
    t.string "url"
    t.string "pagination"
    t.boolean "marked_as_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["web_resource_id"], name: "index_parsers_on_web_resource_id"
  end

  create_table "web_resource_crawler_statuses", force: :cascade do |t|
    t.string "url"
    t.string "status"
    t.datetime "status_at"
    t.integer "last_crawled_events_count"
    t.boolean "marked_as_deleted", default: false
    t.bigint "web_resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["web_resource_id"], name: "index_web_resource_crawler_statuses_on_web_resource_id"
  end

  create_table "web_resources", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.boolean "marked_as_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "web_resources"
  add_foreign_key "parsers", "web_resources"
  add_foreign_key "web_resource_crawler_statuses", "web_resources"
end
