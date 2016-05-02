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

ActiveRecord::Schema.define(version: 20160425164110) do

  create_table "actions", force: :cascade do |t|
    t.string "label"
  end

  create_table "actualites", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "attachements", force: :cascade do |t|
    t.string "label"
  end

  create_table "commentaires", force: :cascade do |t|
    t.integer  "interaction_id"
    t.string   "contenu"
    t.datetime "date"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "interactions", force: :cascade do |t|
    t.string  "type"
    t.integer "article_id"
    t.integer "user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string  "contenu"
    t.integer "sujet"
    t.string  "destinataires"
    t.string  "section"
  end

  create_table "permissions", force: :cascade do |t|
    t.integer "role_id"
    t.integer "action_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string  "commune"
    t.integer "code_postal"
    t.string  "pays"
    t.integer "attachement_id"
    t.integer "nb_commentaires"
    t.integer "nb_projets_suivis"
    t.integer "user_id"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "projets", force: :cascade do |t|
    t.string   "titre"
    t.integer  "categorie_id"
    t.string   "commune"
    t.date     "demarrage"
    t.string   "localisation"
    t.string   "statut"
    t.text     "description"
    t.text     "besoin"
    t.string   "image"
    t.string   "urlsite"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.boolean  "labellise"
  end

  create_table "rapidfire_answer_groups", force: :cascade do |t|
    t.integer  "question_group_id"
    t.integer  "user_id"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rapidfire_answer_groups", ["question_group_id"], name: "index_rapidfire_answer_groups_on_question_group_id"
  add_index "rapidfire_answer_groups", ["user_id", "user_type"], name: "index_rapidfire_answer_groups_on_user_id_and_user_type"

  create_table "rapidfire_answers", force: :cascade do |t|
    t.integer  "answer_group_id"
    t.integer  "question_id"
    t.text     "answer_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rapidfire_answers", ["answer_group_id"], name: "index_rapidfire_answers_on_answer_group_id"
  add_index "rapidfire_answers", ["question_id"], name: "index_rapidfire_answers_on_question_id"

  create_table "rapidfire_question_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rapidfire_questions", force: :cascade do |t|
    t.integer  "question_group_id"
    t.string   "type"
    t.string   "question_text"
    t.integer  "position"
    t.text     "answer_options"
    t.text     "validation_rules"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rapidfire_questions", ["question_group_id"], name: "index_rapidfire_questions_on_question_group_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.text     "the_role",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thematiques", force: :cascade do |t|
    t.string "categorie"
  end

  create_table "users", force: :cascade do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "pseudo"
    t.integer  "role_id",                default: 3
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "confiance",              default: false
    t.boolean  "is_ban",                 default: false
    t.text     "raison_ban"
    t.string   "avatar"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
