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

ActiveRecord::Schema.define(version: 20150526115132) do

  create_table "pay_rates", force: :cascade do |t|
    t.integer  "worker_id"
    t.date     "effective"
    t.integer  "hourly_pay_in_cents"
    t.integer  "hourly_capital_contribution_in_cents"
    t.integer  "hourly_predicted_extra_wage_in_cents"
    t.text     "notes"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "pay_rates", ["worker_id"], name: "index_pay_rates_on_worker_id"

  create_table "shifts", force: :cascade do |t|
    t.integer  "worker_id"
    t.integer  "day_of_week"
    t.date     "monday"
    t.string   "start_time"
    t.string   "end_time"
    t.integer  "task_id"
    t.text     "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  add_index "shifts", ["task_id"], name: "index_shifts_on_task_id"
  add_index "shifts", ["worker_id"], name: "index_shifts_on_worker_id"

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.integer  "workgroup_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "tasks", ["workgroup_id"], name: "index_tasks_on_workgroup_id"

  create_table "workers", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "mobile"
    t.string   "email"
    t.string   "foreground"
    t.string   "background"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workgroup_memberships", force: :cascade do |t|
    t.integer  "worker_id"
    t.integer  "workgroup_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "workgroup_memberships", ["worker_id"], name: "index_workgroup_memberships_on_worker_id"
  add_index "workgroup_memberships", ["workgroup_id"], name: "index_workgroup_memberships_on_workgroup_id"

  create_table "workgroups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
