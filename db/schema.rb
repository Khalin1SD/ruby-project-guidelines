# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 7) do

  create_table "employeeprojects", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "project_id"
    t.string "status"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.integer "employer_id"
    t.integer "project_id"
  end

  create_table "employeeskills", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "skill_id"
    t.integer "competency"
  end

  create_table "employers", force: :cascade do |t|
    t.string "name"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
  end

  create_table "projectskills", force: :cascade do |t|
    t.integer "project_id"
    t.integer "skill_id"
    t.integer "competency_requirement"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
  end

end
