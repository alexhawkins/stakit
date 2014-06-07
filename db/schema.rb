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

ActiveRecord::Schema.define(version: 20140605180642) do

  create_table "activities", force: true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["trackable_id"], name: "index_activities_on_trackable_id"
  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "answer_votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "value"
  end

  add_index "answer_votes", ["answer_id"], name: "index_answer_votes_on_answer_id"
  add_index "answer_votes", ["user_id"], name: "index_answer_votes_on_user_id"

  create_table "answers", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "rank"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "favorite_stacks", force: true do |t|
    t.integer  "stack_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorite_stacks", ["stack_id"], name: "index_favorite_stacks_on_stack_id"
  add_index "favorite_stacks", ["user_id"], name: "index_favorite_stacks_on_user_id"

  create_table "follow_questions", force: true do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follow_questions", ["question_id"], name: "index_follow_questions_on_question_id"
  add_index "follow_questions", ["user_id"], name: "index_follow_questions_on_user_id"

  create_table "follows", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["user_id"], name: "index_follows_on_user_id"

  create_table "frequencies", force: true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_topics", force: true do |t|
    t.integer  "topic_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_topics", ["question_id"], name: "index_question_topics_on_question_id"
  add_index "question_topics", ["topic_id"], name: "index_question_topics_on_topic_id"

  create_table "questions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stack_supplements", force: true do |t|
    t.integer  "stack_id",                  null: false
    t.integer  "supplement_id",             null: false
    t.integer  "frequency_id",  default: 2, null: false
    t.string   "dose"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "stack_supplements", ["frequency_id"], name: "index_stack_supplements_on_frequency_id"
  add_index "stack_supplements", ["stack_id"], name: "index_stack_supplements_on_stack_id"
  add_index "stack_supplements", ["supplement_id"], name: "index_stack_supplements_on_supplement_id"

  create_table "stacks", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description", default: "Details about my stack..."
    t.boolean  "public",      default: true
    t.boolean  "default",     default: false
  end

  add_index "stacks", ["user_id"], name: "index_stacks_on_user_id"

  create_table "supplements", force: true do |t|
    t.string   "name"
    t.string   "default_dose"
    t.string   "default_frequency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "tooltip"
  end

  create_table "topics", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_attachments", force: true do |t|
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_attachments", ["user_id"], name: "index_user_attachments_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "avatar"
    t.string   "location"
    t.boolean  "email_stack_favorites",  default: false
    t.boolean  "email_follows",          default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "videos", force: true do |t|
    t.integer  "user_id"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["user_id"], name: "index_videos_on_user_id"

end
