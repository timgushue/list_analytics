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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140321072654) do

  create_table "user_lists", :force => true do |t|
    t.text     "owner_id"
    t.text     "owner_id_str"
    t.text     "slug"
    t.text     "name"
    t.text     "uri"
    t.text     "created_at",       :null => false
    t.text     "id_str"
    t.integer  "subscriber_count"
    t.integer  "member_count"
    t.text     "mode"
    t.text     "full_name"
    t.text     "description"
    t.datetime "updated_at",       :null => false
  end

  create_table "user_timelines", :force => true do |t|
    t.datetime "created_at",                :null => false
    t.string   "id_str"
    t.text     "text"
    t.text     "source"
    t.boolean  "truncated"
    t.integer  "in_reply_to_status_id"
    t.string   "in_reply_to_status_id_str"
    t.integer  "in_reply_to_user_id"
    t.string   "in_reply_to_user_id_str"
    t.string   "in_reply_to_screen_name"
    t.text     "geo"
    t.text     "coordinates"
    t.text     "place"
    t.text     "contributors"
    t.integer  "retweet_count"
    t.integer  "favorite_count"
    t.boolean  "favorited"
    t.boolean  "retweeted"
    t.boolean  "possibly_sensitive"
    t.string   "lang"
    t.datetime "updated_at",                :null => false
  end

end
