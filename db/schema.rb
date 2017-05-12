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

ActiveRecord::Schema.define(version: 20170512162807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instances", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "deploy_status"
    t.string "progress_status"
    t.index ["name"], name: "index_instances_on_name"
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "release_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lambda_name"
    t.text "log"
    t.bigint "time"
    t.index ["release_id"], name: "index_logs_on_release_id"
  end

  create_table "release_mains", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.bigint "start_time"
    t.bigint "end_time"
    t.index ["uuid"], name: "index_release_mains_on_uuid"
  end

  create_table "releases", force: :cascade do |t|
    t.bigint "release_main_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.bigint "start_time"
    t.bigint "end_time"
    t.bigint "instance_id"
    t.index ["instance_id"], name: "index_releases_on_instance_id"
    t.index ["release_main_id"], name: "index_releases_on_release_main_id"
    t.index ["uuid"], name: "index_releases_on_uuid"
  end

  add_foreign_key "logs", "releases"
  add_foreign_key "releases", "instances"
  add_foreign_key "releases", "release_mains"
end
