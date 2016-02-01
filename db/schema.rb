# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160131212841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "room_id"
    t.datetime "edited_at"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_messages_on_post_id", using: :btree
    t.index ["room_id"], name: "index_messages_on_room_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "post_users", force: :cascade do |t|
    t.datetime "read_at"
    t.integer  "score",      default: 0,     null: false
    t.integer  "post_id"
    t.integer  "user_id"
    t.boolean  "is_muted",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["post_id"], name: "index_post_users_on_post_id", using: :btree
    t.index ["user_id", "post_id"], name: "index_post_users_on_user_id_and_post_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.string   "link"
    t.text     "content"
    t.integer  "score",      default: 0,     null: false
    t.boolean  "is_nsfw"
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "edited_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_private", default: false, null: false
    t.index ["room_id"], name: "index_posts_on_room_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "room_users", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "read_at"
    t.integer  "permissions"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["room_id", "permissions"], name: "index_room_users_on_room_id_and_permissions", using: :btree
    t.index ["room_id"], name: "index_room_users_on_room_id", using: :btree
    t.index ["user_id", "room_id"], name: "index_room_users_on_user_id_and_room_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "squad_id"
    t.integer  "user_id"
    t.boolean  "is_editable", default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_private",  default: true, null: false
    t.index ["squad_id"], name: "index_rooms_on_squad_id", using: :btree
    t.index ["user_id"], name: "index_rooms_on_user_id", using: :btree
  end

  create_table "squad_users", force: :cascade do |t|
    t.integer  "squad_id"
    t.integer  "user_id"
    t.string   "title"
    t.integer  "cred",        default: 0, null: false
    t.integer  "permissions", default: 1, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["squad_id", "permissions"], name: "index_squad_users_on_squad_id_and_permissions", using: :btree
    t.index ["squad_id"], name: "index_squad_users_on_squad_id", using: :btree
    t.index ["user_id", "squad_id"], name: "index_squad_users_on_user_id_and_squad_id", using: :btree
  end

  create_table "squads", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_private", default: true, null: false
    t.index ["name"], name: "index_squads_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "username",   null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
