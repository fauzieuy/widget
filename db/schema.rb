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

ActiveRecord::Schema.define(version: 20170809040043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.integer  "partner_id"
    t.string   "filename"
    t.string   "content_type"
    t.binary   "file_contents"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["partner_id"], name: "index_documents_on_partner_id", using: :btree
  end

  create_table "original_urls", force: :cascade do |t|
    t.string   "url",        default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "partner_id"
    t.index ["partner_id"], name: "index_original_urls_on_partner_id", using: :btree
  end

  create_table "partners", force: :cascade do |t|
    t.string   "name",          default: "", null: false
    t.integer  "counter_click", default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "url"
  end

  add_foreign_key "documents", "partners"
  add_foreign_key "original_urls", "partners"
end