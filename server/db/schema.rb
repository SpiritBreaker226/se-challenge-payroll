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

ActiveRecord::Schema.define(version: 2020_08_28_002759) do

  create_table "employees", force: :cascade do |t|
    t.string "employee_id", limit: 50, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_groups", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.decimal "hour_rate", precision: 8, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payrolls", force: :cascade do |t|
    t.date "payroll_date", null: false
    t.decimal "hours", precision: 2, scale: 2, null: false
    t.integer "payroll_id", null: false
    t.integer "employee_id", null: false
    t.integer "job_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_payrolls_on_employee_id"
    t.index ["job_group_id"], name: "index_payrolls_on_job_group_id"
  end

  add_foreign_key "payrolls", "employees"
  add_foreign_key "payrolls", "job_groups"
end
