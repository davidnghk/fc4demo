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

ActiveRecord::Schema.define(version: 2020_05_28_015358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "assignees", force: :cascade do |t|
    t.bigint "assignment_id", null: false
    t.bigint "team_id", null: false
    t.integer "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_id"], name: "index_assignees_on_assignment_id"
    t.index ["team_id"], name: "index_assignees_on_team_id"
  end

  create_table "assignment_items", force: :cascade do |t|
    t.bigint "assignment_id", null: false
    t.bigint "work_item_id"
    t.integer "rating"
    t.string "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "serial_number"
    t.index ["assignment_id"], name: "index_assignment_items_on_assignment_id"
    t.index ["work_item_id"], name: "index_assignment_items_on_work_item_id"
  end

  create_table "assignment_logs", force: :cascade do |t|
    t.bigint "assignment_id", null: false
    t.integer "actor_id"
    t.string "action"
    t.integer "team_id"
    t.integer "operation_team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_id"], name: "index_assignment_logs_on_assignment_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.integer "work_id"
    t.bigint "location_id", null: false
    t.bigint "team_id", null: false
    t.integer "operation_team_id"
    t.string "name"
    t.datetime "start_datetime"
    t.datetime "due_datetime"
    t.datetime "end_datetime"
    t.integer "status"
    t.string "aasm_state"
    t.integer "aasm_supplement"
    t.integer "ref_no"
    t.string "ancestry"
    t.string "user_ref"
    t.integer "parent_id"
    t.text "comments"
    t.string "color"
    t.string "date_range"
    t.string "address"
    t.decimal "longitude", precision: 10, scale: 6
    t.decimal "altitude", precision: 10, scale: 6
    t.decimal "latitude", precision: 10, scale: 6
    t.string "block_hash"
    t.integer "nonce"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "source"
    t.string "origin"
    t.boolean "delete_bimfile"
    t.index ["location_id"], name: "index_assignments_on_location_id"
    t.index ["team_id"], name: "index_assignments_on_team_id"
  end

  create_table "defects", force: :cascade do |t|
    t.bigint "assignment_id", null: false
    t.integer "issue_id"
    t.integer "rating"
    t.string "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_id"], name: "index_defects_on_assignment_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "local_name"
    t.string "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "team_id"
    t.index ["team_id"], name: "index_locations_on_team_id"
  end

  create_table "masters", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.string "code"
    t.string "name"
    t.string "local_name"
    t.integer "parent_id"
    t.string "icon"
    t.integer "setting1"
    t.string "param1"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_masters_on_team_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.integer "role", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_members_on_team_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "category"
    t.string "image"
    t.decimal "longitude", precision: 15, scale: 8
    t.decimal "altitude", precision: 15, scale: 8
    t.decimal "latitude", precision: 15, scale: 8
    t.string "photoable_type"
    t.bigint "photoable_id"
    t.boolean "is_printable"
    t.datetime "photo_datetime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["photoable_id"], name: "index_photos_on_photoable_id"
  end

  create_table "readings", force: :cascade do |t|
    t.string "thing"
    t.datetime "reading_time"
    t.string "content"
    t.integer "thing_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_assignments", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "assignment_id", null: false
    t.integer "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assignment_id"], name: "index_team_assignments_on_assignment_id"
    t.index ["assignment_id"], name: "index_teams_on_assignment_id"
    t.index ["team_id"], name: "index_team_assignments_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "local_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "no"
    t.bigint "user_id", null: false
    t.integer "actor_id"
    t.string "message"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "read_at"
    t.index ["user_id"], name: "index_tickets_on_user_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.integer "role", default: 0
    t.string "name"
    t.integer "unread", default: 0
    t.string "encrypted_otp_secret"
    t.string "encrypted_otp_secret_iv"
    t.string "encrypted_otp_secret_salt"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login"
    t.string "otp_backup_codes", array: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "work_items", force: :cascade do |t|
    t.bigint "work_id", null: false
    t.string "code"
    t.string "name"
    t.string "local_name"
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["work_id"], name: "index_work_items_on_work_id"
  end

  create_table "works", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.string "code"
    t.string "name"
    t.string "local_name"
    t.integer "icon_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "workflow_id"
    t.index ["team_id"], name: "index_works_on_team_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "assignees", "assignments"
  add_foreign_key "assignees", "teams"
  add_foreign_key "assignment_items", "assignments"
  add_foreign_key "assignment_logs", "assignments"
  add_foreign_key "assignments", "locations"
  add_foreign_key "assignments", "teams"
  add_foreign_key "defects", "assignments"
  add_foreign_key "locations", "teams"
  add_foreign_key "masters", "teams"
  add_foreign_key "members", "teams"
  add_foreign_key "members", "users"
  add_foreign_key "team_assignments", "assignments"
  add_foreign_key "team_assignments", "teams"
  add_foreign_key "tickets", "users"
  add_foreign_key "work_items", "works"
  add_foreign_key "works", "teams"
end
