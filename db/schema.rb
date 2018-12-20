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

ActiveRecord::Schema.define(version: 20181117014059) do

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.text "note"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["organization_id"], name: "index_contacts_on_organization_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "event_translations", force: :cascade do |t|
    t.integer "event_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", null: false
    t.text "body"
    t.index ["event_id"], name: "index_event_translations_on_event_id"
    t.index ["locale"], name: "index_event_translations_on_locale"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "starts_at", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "location_id", null: false
    t.integer "user_id", null: false
    t.string "state", default: "proposed"
    t.integer "talks_count", default: 0
    t.integer "sponsorships_count", default: 0
    t.integer "organizer_id"
    t.index ["location_id"], name: "index_events_on_location_id"
    t.index ["starts_at"], name: "index_events_on_starts_at"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "events_members", force: :cascade do |t|
    t.integer "event_id"
    t.integer "member_id"
    t.index ["event_id"], name: "index_events_members_on_event_id"
    t.index ["member_id"], name: "index_events_members_on_member_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "state"
    t.string "title"
    t.text "description"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.datetime "published_at"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "location_translations", force: :cascade do |t|
    t.integer "location_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.text "directions"
    t.index ["locale"], name: "index_location_translations_on_locale"
    t.index ["location_id"], name: "index_location_translations_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.text "address"
    t.string "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "picture"
    t.string "twitter_handle"
    t.string "github_handle"
    t.text "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "website"
    t.string "company"
  end

  create_table "members_organizations", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "member_id"
    t.index ["member_id"], name: "index_members_organizations_on_member_id"
    t.index ["organization_id"], name: "index_members_organizations_on_organization_id"
  end

  create_table "news_items", force: :cascade do |t|
    t.string "state"
    t.datetime "published_at"
    t.text "body"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "user_id", null: false
    t.index ["slug"], name: "index_news_items_on_slug"
    t.index ["user_id"], name: "index_news_items_on_user_id"
  end

  create_table "organization_translations", force: :cascade do |t|
    t.integer "organization_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["locale"], name: "index_organization_translations_on_locale"
    t.index ["organization_id"], name: "index_organization_translations_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.string "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_organizations_on_name"
  end

  create_table "page_translations", force: :cascade do |t|
    t.integer "page_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.string "title", null: false
    t.index ["locale"], name: "index_page_translations_on_locale"
    t.index ["page_id"], name: "index_page_translations_on_page_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", default: "temporary-slug", null: false
    t.index ["slug"], name: "index_pages_on_slug", unique: true
  end

  create_table "sponsorships", force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "message"
    t.index ["event_id"], name: "index_sponsorships_on_event_id"
    t.index ["organization_id"], name: "index_sponsorships_on_organization_id"
  end

  create_table "talk_translations", force: :cascade do |t|
    t.integer "talk_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["locale"], name: "index_talk_translations_on_locale"
    t.index ["talk_id"], name: "index_talk_translations_on_talk_id"
  end

  create_table "talks", force: :cascade do |t|
    t.string "state"
    t.string "level"
    t.string "slides_url"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_id"
    t.string "format"
    t.string "youtube_id"
    t.index ["event_id"], name: "index_talks_on_event_id"
    t.index ["member_id"], name: "index_talks_on_member_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "provider"
    t.string "uid"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid"
  end

end
