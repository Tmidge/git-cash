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

ActiveRecord::Schema.define(version: 20150304213551) do

  create_table "profiles", force: :cascade do |t|
    t.string   "avatar_url"
    t.text     "body"
    t.string   "username"
    t.string   "location"
    t.string   "company_name"
    t.integer  "number_of_followers"
    t.integer  "number_following"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "repositories", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.string   "url"
    t.string   "language"
    t.datetime "updated_at",      null: false
    t.integer  "number_of_forks"
    t.integer  "number_of_stars"
    t.datetime "created_at",      null: false
  end

end
