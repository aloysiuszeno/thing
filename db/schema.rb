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

ActiveRecord::Schema.define(version: 20170131204915) do

  create_table "authentications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "uid"
    t.string "oauth"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "changelogs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "action"
    t.integer "target_id"
    t.string "target_type"
    t.text "changelog"
    t.boolean "notified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "year"
    t.text "original"
    t.text "committed"
  end

  create_table "instances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "instructable_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "override_location"
    t.integer "year"
    t.index ["instructable_id"], name: "index_instances_on_instructable_id"
  end

  create_table "instructables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.boolean "approved", default: false
    t.string "name"
    t.integer "material_limit"
    t.integer "handout_limit"
    t.text "description_web"
    t.float "handout_fee", limit: 24
    t.float "material_fee", limit: 24
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "duration", limit: 24
    t.string "culture"
    t.string "topic"
    t.string "subtopic"
    t.text "description_book"
    t.string "additional_instructors"
    t.string "camp_name"
    t.string "camp_address"
    t.string "camp_reason"
    t.boolean "adult_only", default: false
    t.string "adult_reason"
    t.text "fee_itemization"
    t.date "requested_days"
    t.integer "repeat_count", default: 0
    t.text "scheduling_additional"
    t.string "special_needs"
    t.text "special_needs_description"
    t.boolean "heat_source", default: false
    t.text "heat_source_description"
    t.string "requested_times"
    t.string "track"
    t.boolean "scheduled", default: false
    t.string "location_type", default: "track"
    t.boolean "proofread", default: false
    t.integer "proofread_by", default: 0
    t.text "proofreader_comments"
    t.string "schedule"
    t.string "info_tag"
  end

  create_table "instructor_profile_contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "protocol"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "policies", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "area"
    t.string "user_id"
    t.datetime "accepted_on"
    t.integer "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "mailed_on"
    t.index ["user_id"], name: "index_policies_on_user_id"
  end

  create_table "schedules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.integer "instructables", default: 0
    t.boolean "published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "year"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "access_token"
    t.boolean "admin", default: false
    t.boolean "pu_staff"
    t.string "tracks", default: "{}"
    t.boolean "proofreader", default: false
    t.timestamp "profile_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
