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

ActiveRecord::Schema.define(version: 2019_02_14_172857) do

  create_table "decisions", force: :cascade do |t|
    t.text "description"
    t.text "rationale"
    t.integer "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_decisions_on_meeting_id"
  end

  create_table "hyperstack_connections", force: :cascade do |t|
    t.string "channel"
    t.string "session"
    t.datetime "created_at"
    t.datetime "expires_at"
    t.datetime "refresh_at"
  end

  create_table "hyperstack_queued_messages", force: :cascade do |t|
    t.text "data"
    t.integer "connection_id"
  end

  create_table "learnings", force: :cascade do |t|
    t.text "description"
    t.integer "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_learnings_on_meeting_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.string "name"
    t.datetime "start_at"
    t.integer "duration"
    t.text "description"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_meetings_on_project_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "description"
    t.integer "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_notes_on_meeting_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "private"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_projects_on_organization_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.integer "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_tasks_on_meeting_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.boolean "completed"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
