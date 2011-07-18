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

ActiveRecord::Schema.define(:version => 20110711123849) do

  create_table "addressinfos", :force => true do |t|
    t.integer  "people_id",                :null => false
    t.string   "type_ident", :limit => 30, :null => false
    t.string   "type_name",  :limit => 50, :null => false
    t.string   "address1",   :limit => 50
    t.string   "address2",   :limit => 50
    t.string   "city",       :limit => 25
    t.string   "state",      :limit => 10
    t.string   "zip",        :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                  :null => false
  end

  create_table "contactinfos", :force => true do |t|
    t.integer  "people_id",                :null => false
    t.string   "type_ident", :limit => 30, :null => false
    t.string   "type_name",  :limit => 50, :null => false
    t.string   "contact",                  :null => false
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                  :null => false
  end

  create_table "contacttypes", :force => true do |t|
    t.string   "type_ident", :limit => 30, :null => false
    t.string   "type_name",  :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                  :null => false
  end

  create_table "notes", :force => true do |t|
    t.integer  "people_id"
    t.string   "title",      :limit => 30
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                  :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "last_name",   :null => false
    t.string   "first_name",  :null => false
    t.string   "middle_name"
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "phone"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
