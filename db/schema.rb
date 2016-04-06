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

ActiveRecord::Schema.define(version: 20160405094145) do

  create_table "actions", force: :cascade do |t|
    t.string "label"
  end

  create_table "articles", force: :cascade do |t|
    t.text    "contenu"
    t.integer "publication_id"
  end

  create_table "articles_media", id: false, force: :cascade do |t|
    t.integer "medium_id",  null: false
    t.integer "article_id", null: false
  end

  create_table "attachements", force: :cascade do |t|
    t.string "label"
  end

  create_table "cibles", force: :cascade do |t|
    t.string "nom_table"
  end

  create_table "commentaires", force: :cascade do |t|
    t.integer  "interaction_id"
    t.string   "contenu"
    t.datetime "date"
  end

  create_table "comptes", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "nom"
    t.string   "prenom"
    t.string   "pseudo"
    t.integer  "statut_id"
  end

  add_index "comptes", ["confirmation_token"], name: "index_comptes_on_confirmation_token", unique: true
  add_index "comptes", ["email"], name: "index_comptes_on_email", unique: true
  add_index "comptes", ["reset_password_token"], name: "index_comptes_on_reset_password_token", unique: true

  create_table "interactions", force: :cascade do |t|
    t.string  "type"
    t.integer "article_id"
    t.integer "utilisateur_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "type"
    t.string "chemin"
  end

  create_table "permissions", force: :cascade do |t|
    t.integer "statut_id"
    t.integer "cible_id"
    t.integer "action_id"
    t.boolean "droit"
  end

  create_table "projets", force: :cascade do |t|
    t.string  "localisation"
    t.string  "theme"
    t.date    "date_lancement"
    t.text    "besoins"
    t.integer "article_id"
    t.string  "territoire"
    t.string  "etat_avancement"
    t.string  "lien_url"
  end

  create_table "publications", force: :cascade do |t|
    t.boolean "online"
    t.integer "utilisateur_id"
    t.date    "online_date"
    t.text    "titre"
  end

  create_table "sondages", force: :cascade do |t|
    t.integer  "publication_id"
    t.datetime "date_fin"
  end

  create_table "statuts", force: :cascade do |t|
    t.string "label"
  end

  create_table "utilisateurs", force: :cascade do |t|
    t.string  "commune"
    t.integer "code_postal"
    t.string  "pays"
    t.integer "attachement_id"
    t.integer "nb_commentaires"
    t.integer "nb_projets_suivis"
  end

end
