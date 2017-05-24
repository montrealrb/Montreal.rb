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

ActiveRecord::Schema.define(version: 20170524022609) do
  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.text     "note"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
  end

  add_index "contacts", ["organization_id"], name: "index_contacts_on_organization_id"
  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id"

  create_table "event_translations", force: :cascade do |t|
    t.integer  "event_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title",      null: false
    t.text     "body"
  end

  add_index "event_translations", ["event_id"], name: "index_event_translations_on_event_id"
  add_index "event_translations", ["locale"], name: "index_event_translations_on_locale"

  create_table "events", force: :cascade do |t|
    t.datetime "starts_at",                               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id",                             null: false
    t.integer  "user_id",                                 null: false
    t.string   "state",              default: "proposed"
    t.integer  "talks_count",        default: 0
    t.integer  "sponsorships_count", default: 0
  end

  add_index "events", ["location_id"], name: "index_events_on_location_id"
  add_index "events", ["starts_at"], name: "index_events_on_starts_at"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "events_members", force: :cascade do |t|
    t.integer "event_id"
    t.integer "member_id"
  end

  add_index "events_members", ["event_id"], name: "index_events_members_on_event_id"
  add_index "events_members", ["member_id"], name: "index_events_members_on_member_id"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "jobs", force: :cascade do |t|
    t.string   "state"
    t.string   "title"
    t.text     "description"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id",         null: false
    t.datetime "published_at"
  end

  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id"

  create_table "location_translations", force: :cascade do |t|
    t.integer  "location_id", null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.text     "directions"
  end

  add_index "location_translations", ["locale"], name: "index_location_translations_on_locale"
  add_index "location_translations", ["location_id"], name: "index_location_translations_on_location_id"

  create_table "locations", force: :cascade do |t|
    t.string   "name",       null: false
    t.text     "address"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "email",          null: false
    t.string   "picture"
    t.string   "twitter_handle"
    t.string   "github_handle"
    t.text     "biography"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.string   "website"
    t.string   "company"
  end

  create_table "members_organizations", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "member_id"
  end

  add_index "members_organizations", ["member_id"], name: "index_members_organizations_on_member_id"
  add_index "members_organizations", ["organization_id"], name: "index_members_organizations_on_organization_id"

  create_table "news_items", force: :cascade do |t|
    t.string   "state"
    t.datetime "published_at"
    t.text     "body"
    t.string   "title"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slug"
    t.integer  "user_id",      null: false
  end

  add_index "news_items", ["slug"], name: "index_news_items_on_slug"
  add_index "news_items", ["user_id"], name: "index_news_items_on_user_id"

  create_table "organization_translations", force: :cascade do |t|
    t.integer  "organization_id", null: false
    t.string   "locale",          null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "description"
  end

  add_index "organization_translations", ["locale"], name: "index_organization_translations_on_locale"
  add_index "organization_translations", ["organization_id"], name: "index_organization_translations_on_organization_id"

  create_table "organizations", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "address"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_translations", force: :cascade do |t|
    t.integer  "page_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "body"
    t.string   "title",      null: false
  end

  add_index "page_translations", ["locale"], name: "index_page_translations_on_locale"
  add_index "page_translations", ["page_id"], name: "index_page_translations_on_page_id"

  create_table "pages", force: :cascade do |t|
    t.string   "state",                                 null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "slug",       default: "temporary-slug", null: false
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true

  create_table "sponsorships", force: :cascade do |t|
    t.integer  "event_id",        null: false
    t.integer  "organization_id", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "message"
  end

  add_index "sponsorships", ["event_id"], name: "index_sponsorships_on_event_id"
  add_index "sponsorships", ["organization_id"], name: "index_sponsorships_on_organization_id"

  create_table "talk_translations", force: :cascade do |t|
    t.integer  "talk_id",     null: false
    t.string   "locale",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.text     "description"
  end

  add_index "talk_translations", ["locale"], name: "index_talk_translations_on_locale"
  add_index "talk_translations", ["talk_id"], name: "index_talk_translations_on_talk_id"

  create_table "talks", force: :cascade do |t|
    t.string   "state"
    t.string   "level"
    t.string   "slides_url"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "member_id"
    t.string   "format"
  end

  add_index "talks", ["event_id"], name: "index_talks_on_event_id"
  add_index "talks", ["member_id"], name: "index_talks_on_member_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "admin",                  default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"

end
