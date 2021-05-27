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

ActiveRecord::Schema.define(version: 2020_12_09_215549) do

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "confirmation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "evaluator"
    t.string "evaluatee"
    t.integer "project"
    t.integer "score"
    t.string "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "student_id"
    t.integer "group_id"
    t.index ["group_id"], name: "index_evaluations_on_group_id"
    t.index ["student_id"], name: "index_evaluations_on_student_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "student_id"
    t.integer "evaluation_id"
    t.index ["evaluation_id"], name: "index_groups_on_evaluation_id"
    t.index ["student_id"], name: "index_groups_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "group_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.integer "group_id"
    t.integer "evaluation_id"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["evaluation_id"], name: "index_students_on_evaluation_id"
    t.index ["group_id"], name: "index_students_on_group_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "doc_file_name"
    t.string "doc_content_type"
    t.integer "doc_file_size"
    t.datetime "doc_updated_at"
  end

end
