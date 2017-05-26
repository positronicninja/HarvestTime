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

ActiveRecord::Schema.define(version: 20170525220831) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.integer "organization_id"
    t.integer "harvest_id"
    t.datetime "harvest_created_at"
    t.datetime "harvest_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_clients_on_organization_id"
  end

  create_table "collaborations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.string "notes"
    t.decimal "hours", precision: 8, scale: 2
    t.integer "staff_id"
    t.integer "client_id"
    t.integer "project_id"
    t.integer "organization_task_id"
    t.integer "harvest_id"
    t.integer "harvest_task_id"
    t.integer "harvest_project_id"
    t.datetime "harvest_spent_on"
    t.datetime "harvest_created_at"
    t.datetime "harvest_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_entries_on_client_id"
    t.index ["harvest_id"], name: "index_entries_on_harvest_id"
    t.index ["harvest_project_id"], name: "index_entries_on_harvest_project_id"
    t.index ["harvest_task_id"], name: "index_entries_on_harvest_task_id"
    t.index ["organization_task_id"], name: "index_entries_on_organization_task_id"
    t.index ["project_id"], name: "index_entries_on_project_id"
    t.index ["staff_id"], name: "index_entries_on_staff_id"
  end

  create_table "organization_tasks", force: :cascade do |t|
    t.string "name"
    t.integer "organization_id"
    t.integer "task_id"
    t.integer "harvest_id"
    t.datetime "harvest_created_at"
    t.datetime "harvest_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_organization_tasks_on_organization_id"
    t.index ["task_id"], name: "index_organization_tasks_on_task_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "base_uri"
    t.string "full_domain"
    t.string "harvest_id"
    t.string "harvest_key"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.integer "client_id"
    t.integer "organization_id"
    t.integer "collaboration_id"
    t.integer "harvest_id"
    t.datetime "harvest_starts_on"
    t.datetime "harvest_created_at"
    t.datetime "harvest_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
    t.index ["collaboration_id"], name: "index_projects_on_collaboration_id"
    t.index ["harvest_id"], name: "index_projects_on_harvest_id"
    t.index ["organization_id"], name: "index_projects_on_organization_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "active"
    t.integer "organization_id"
    t.integer "harvest_id"
    t.datetime "harvest_created_at"
    t.datetime "harvest_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["harvest_id"], name: "index_staffs_on_harvest_id"
    t.index ["organization_id"], name: "index_staffs_on_organization_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
