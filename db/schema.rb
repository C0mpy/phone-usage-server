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

ActiveRecord::Schema.define(version: 2019_02_11_223855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "question_responses", force: :cascade do |t|
    t.integer "response"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_responses_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.bigint "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "survey_results", force: :cascade do |t|
    t.string "survey_id"
    t.string "user_uuid"
    t.bigint "question_responses_id"
    t.index ["question_responses_id"], name: "index_survey_results_on_question_responses_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "question_responses", "questions"
  add_foreign_key "questions", "surveys"
  add_foreign_key "survey_results", "question_responses", column: "question_responses_id"
end
