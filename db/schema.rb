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

ActiveRecord::Schema.define(:version => 20121214162906) do

  create_table "recordings", :force => true do |t|
    t.string   "name"
    t.datetime "start"
    t.integer  "duration"
    t.string   "criteria"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "date_text"
    t.string   "time_text"
    t.integer  "user_id"
    t.datetime "end_time"
  end

  create_table "tweets", :force => true do |t|
    t.integer  "recording_id"
    t.string   "item"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "tweetstores", :force => true do |t|
    t.string   "name"
    t.string   "screen_name"
    t.string   "text"
    t.string   "profile_image_url"
    t.datetime "tweeted_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "uid"
    t.string   "provider"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "nickname"
    t.string   "token"
    t.string   "secret"
    t.string   "twitter_profile_image"
  end

end
