# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100803123630) do

  create_table "planets", :force => true do |t|
    t.string   "name"
    t.integer  "x_pos"
    t.integer  "y_pos"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "credits",                 :default => 0, :null => false
    t.integer  "durasteel",               :default => 0, :null => false
    t.integer  "plasteel",                :default => 0, :null => false
    t.integer  "tibanna",                 :default => 0, :null => false
    t.integer  "buying_durasteel",        :default => 0, :null => false
    t.integer  "buying_plasteel",         :default => 0, :null => false
    t.integer  "buying_tibanna",          :default => 0, :null => false
    t.integer  "selling_durasteel",       :default => 0, :null => false
    t.integer  "selling_plasteel",        :default => 0, :null => false
    t.integer  "selling_tibanna",         :default => 0, :null => false
    t.integer  "selling_durasteel_price", :default => 1, :null => false
    t.integer  "selling_plasteel_price",  :default => 1, :null => false
    t.integer  "selling_tibanna_price",   :default => 1, :null => false
    t.integer  "buying_durasteel_price",  :default => 1, :null => false
    t.integer  "buying_plasteel_price",   :default => 1, :null => false
    t.integer  "buying_tibanna_price",    :default => 1, :null => false
  end

  create_table "starships", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "x_pos"
    t.integer  "y_pos"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "arrival_time"
    t.integer  "speed"
    t.integer  "credits",                 :default => 0, :null => false
    t.integer  "durasteel",               :default => 0, :null => false
    t.integer  "plasteel",                :default => 0, :null => false
    t.integer  "tibanna",                 :default => 0, :null => false
    t.integer  "buying_durasteel",        :default => 0, :null => false
    t.integer  "buying_plasteel",         :default => 0, :null => false
    t.integer  "buying_tibanna",          :default => 0, :null => false
    t.integer  "selling_durasteel",       :default => 0, :null => false
    t.integer  "selling_plasteel",        :default => 0, :null => false
    t.integer  "selling_tibanna",         :default => 0, :null => false
    t.integer  "selling_durasteel_price", :default => 1, :null => false
    t.integer  "selling_plasteel_price",  :default => 1, :null => false
    t.integer  "selling_tibanna_price",   :default => 1, :null => false
    t.integer  "buying_durasteel_price",  :default => 1, :null => false
    t.integer  "buying_plasteel_price",   :default => 1, :null => false
    t.integer  "buying_tibanna_price",    :default => 1, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
