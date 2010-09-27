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

ActiveRecord::Schema.define(:version => 20100927150543) do

  create_table "starships", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "x_coord"
    t.integer  "y_coord"
    t.integer  "speed"
    t.integer  "durasteel"
    t.integer  "buying_durasteel_price"
    t.integer  "selling_durasteel_price"
    t.integer  "plasteel"
    t.integer  "buying_plasteel_price"
    t.integer  "selling_plasteel_price"
    t.integer  "tibanna"
    t.integer  "buying_tibanna_price"
    t.integer  "selling_tibanna_price"
    t.string   "name"
    t.integer  "credits"
    t.boolean  "enable_selling_durasteel"
    t.boolean  "enable_selling_plasteel"
    t.boolean  "enable_selling_tibanna"
    t.integer  "buying_durasteel_upto"
    t.integer  "selling_durasteel_downto"
    t.integer  "buying_plasteel_upto"
    t.integer  "selling_plasteel_downto"
    t.integer  "buying_tibanna_upto"
    t.integer  "selling_tibanna_downto"
  end

  create_table "travels", :force => true do |t|
    t.integer  "x_dest"
    t.integer  "y_dest"
    t.integer  "speed"
    t.datetime "arrival_time"
    t.integer  "starship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "x_start"
    t.integer  "y_start"
  end

  create_table "users", :force => true do |t|
    t.string   "username",          :null => false
    t.string   "email",             :null => false
    t.string   "crypted_password",  :null => false
    t.string   "password_salt",     :null => false
    t.string   "persistence_token", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
