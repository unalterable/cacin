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

ActiveRecord::Schema.define(version: 20160830135016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_mail_logs", force: :cascade do |t|
    t.integer  "event_mail_id"
    t.integer  "member_id"
    t.integer  "member_token_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["event_mail_id"], name: "index_event_mail_logs_on_event_mail_id", using: :btree
    t.index ["member_id"], name: "index_event_mail_logs_on_member_id", using: :btree
    t.index ["member_token_id"], name: "index_event_mail_logs_on_member_token_id", using: :btree
  end

  create_table "event_mails", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "name"
    t.string   "from"
    t.text     "html_template"
    t.text     "plain_text_template"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "subject"
    t.boolean  "sent"
    t.boolean  "includes_rsvp"
    t.index ["event_id"], name: "index_event_mails_on_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.string   "location"
    t.text     "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "event_id"
    t.text     "html"
    t.text     "plain_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.text     "notes"
    t.index ["event_id"], name: "index_invitations_on_event_id", using: :btree
  end

  create_table "member_tokens", force: :cascade do |t|
    t.string   "token"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "rsvp_id"
    t.integer  "times_used"
    t.text     "notes"
    t.index ["member_id"], name: "index_member_tokens_on_member_id", using: :btree
    t.index ["rsvp_id"], name: "index_member_tokens_on_rsvp_id", using: :btree
  end

  create_table "members", force: :cascade do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "job_title"
    t.string   "organisation"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "priority"
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "member_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_rsvps_on_event_id", using: :btree
    t.index ["member_id"], name: "index_rsvps_on_member_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "event_mail_logs", "event_mails"
  add_foreign_key "event_mail_logs", "member_tokens"
  add_foreign_key "event_mail_logs", "members"
  add_foreign_key "event_mails", "events"
  add_foreign_key "invitations", "events"
  add_foreign_key "member_tokens", "members"
  add_foreign_key "member_tokens", "rsvps"
  add_foreign_key "rsvps", "events"
  add_foreign_key "rsvps", "members"
end
