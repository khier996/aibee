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

ActiveRecord::Schema.define(version: 20170403045410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "review"
    t.text     "comment"
    t.integer  "pax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
    t.index ["event_id"], name: "index_bookings_on_event_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo_url"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "hobby_id"
    t.integer  "price"
    t.integer  "min_pax"
    t.integer  "max_pax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.index ["hobby_id"], name: "index_events_on_hobby_id", using: :btree
  end

  create_table "hobbies", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.integer  "likes"
    t.text     "description"
    t.string   "summary"
    t.string   "address"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "review_count"
    t.boolean  "deleted"
    t.boolean  "hidden"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "average_score"
    t.index ["user_id"], name: "index_hobbies_on_user_id", using: :btree
  end

  create_table "hobby_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "hobby_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_hobby_categories_on_category_id", using: :btree
    t.index ["hobby_id"], name: "index_hobby_categories_on_hobby_id", using: :btree
  end

  create_table "user_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_user_categories_on_category_id", using: :btree
    t.index ["user_id"], name: "index_user_categories_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.text     "bio"
    t.string   "gender"
    t.string   "phone_number"
    t.date     "birthdate"
    t.boolean  "admin",                  default: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "votable_id", "votable_type", "vote_scope"], name: "uniq_vote_index", unique: true, using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  add_foreign_key "bookings", "events"
  add_foreign_key "bookings", "users"
  add_foreign_key "events", "hobbies"
  add_foreign_key "hobbies", "users"
  add_foreign_key "hobby_categories", "categories"
  add_foreign_key "hobby_categories", "hobbies"
  add_foreign_key "user_categories", "categories"
  add_foreign_key "user_categories", "users"
end
