# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_20_054807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bullets", force: :cascade do |t|
    t.string "name"
    t.bigint "manufacturer_id", null: false
    t.float "diameter"
    t.float "weight"
    t.float "g1_bc"
    t.float "g7_bc"
    t.string "mpn"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manufacturer_id"], name: "index_bullets_on_manufacturer_id"
  end

  create_table "cartridges", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "manufacturer_load_data", force: :cascade do |t|
    t.bigint "manufacturer_id", null: false
    t.bigint "bullet_id", null: false
    t.bigint "smokeless_powder_id", null: false
    t.string "coal"
    t.string "cbto"
    t.float "powder_charge"
    t.float "velocity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "max_charge", default: false
    t.bigint "cartridge_id", null: false
    t.index ["bullet_id"], name: "index_manufacturer_load_data_on_bullet_id"
    t.index ["cartridge_id"], name: "index_manufacturer_load_data_on_cartridge_id"
    t.index ["manufacturer_id"], name: "index_manufacturer_load_data_on_manufacturer_id"
    t.index ["smokeless_powder_id"], name: "index_manufacturer_load_data_on_smokeless_powder_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reloading_checklist_steps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "smokeless_powders", force: :cascade do |t|
    t.string "name"
    t.bigint "manufacturer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manufacturer_id"], name: "index_smokeless_powders_on_manufacturer_id"
  end

  create_table "user_load_data", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "bullet_id", null: false
    t.bigint "smokeless_powder_id", null: false
    t.string "coal"
    t.string "cbto"
    t.float "powder_charge"
    t.float "velocity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cartridge_id", null: false
    t.index ["bullet_id"], name: "index_user_load_data_on_bullet_id"
    t.index ["cartridge_id"], name: "index_user_load_data_on_cartridge_id"
    t.index ["smokeless_powder_id"], name: "index_user_load_data_on_smokeless_powder_id"
    t.index ["user_id"], name: "index_user_load_data_on_user_id"
  end

  create_table "user_reloading_checklist_steps", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.bigint "user_reloading_checklist_id", null: false
    t.integer "order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_reloading_checklist_steps_on_user_id"
    t.index ["user_reloading_checklist_id"], name: "index_steps_on_checklist_id"
  end

  create_table "user_reloading_checklists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_reloading_checklists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "bullets", "manufacturers"
  add_foreign_key "manufacturer_load_data", "bullets"
  add_foreign_key "manufacturer_load_data", "cartridges"
  add_foreign_key "manufacturer_load_data", "manufacturers"
  add_foreign_key "manufacturer_load_data", "smokeless_powders"
  add_foreign_key "smokeless_powders", "manufacturers"
  add_foreign_key "user_load_data", "bullets"
  add_foreign_key "user_load_data", "cartridges"
  add_foreign_key "user_load_data", "smokeless_powders"
  add_foreign_key "user_load_data", "users"
  add_foreign_key "user_reloading_checklist_steps", "user_reloading_checklists"
  add_foreign_key "user_reloading_checklist_steps", "users"
  add_foreign_key "user_reloading_checklists", "users"
end
