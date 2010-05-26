# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100526011648) do

  create_table "accounts", :force => true do |t|
    t.string   "identity_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contributions", :force => true do |t|
    t.integer  "rubyist_id",        :null => false
    t.integer  "ruby_kaigi_id",     :null => false
    t.string   "contribution_type", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_item_id"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "exchange_tickets", :force => true do |t|
    t.integer  "paypal_transaction_id"
    t.string   "code4u"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "headline_entries", :force => true do |t|
    t.text     "title"
    t.datetime "time"
    t.text     "link"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "language"
  end

  add_index "headline_entries", ["language"], :name => "index_headline_entries_on_language"
  add_index "headline_entries", ["time"], :name => "index_headline_entries_on_time"

  create_table "individual_sponsor_options", :force => true do |t|
    t.integer  "additional_amount", :default => 0,     :null => false
    t.string   "link_label"
    t.string   "link_url"
    t.boolean  "attend_party",      :default => false, :null => false
    t.integer  "order_item_id",                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lightning_talk_selections", :force => true do |t|
    t.integer  "lightning_talk_submission_id"
    t.integer  "result",                       :default => -1, :null => false
    t.integer  "disp_order",                   :default => 0,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lightning_talk_submissions", :force => true do |t|
    t.text     "name"
    t.text     "organization"
    t.text     "email"
    t.text     "title"
    t.text     "abstract"
    t.boolean  "has_ticket"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "day1"
    t.string   "day2"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "order_items", :force => true do |t|
    t.integer  "order_id",                       :null => false
    t.integer  "product_item_id",                :null => false
    t.integer  "quantity",        :default => 1, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_price",      :default => 0, :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "rubyist_id",                                        :null => false
    t.boolean  "return_from_paypal",             :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "purchased_at"
    t.integer  "price",                          :default => 0,     :null => false
    t.integer  "paypal_payment_notification_id"
    t.integer  "ruby_kaigi_id",                  :default => 5,     :null => false
    t.string   "invoice_code",                                      :null => false
  end

  create_table "paypal_payment_notifications", :force => true do |t|
    t.string   "payment_status",          :null => false
    t.string   "txn_id"
    t.string   "receipt_id"
    t.string   "payer_email"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "payer_id"
    t.string   "address_zip"
    t.string   "address_state"
    t.string   "address_city"
    t.string   "address_street"
    t.string   "address_name"
    t.string   "payment_date"
    t.integer  "tax"
    t.text     "notified_params_as_json", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invoice"
  end

  create_table "paypal_transactions", :force => true do |t|
    t.string   "txn_id",            :null => false
    t.string   "item_number",       :null => false
    t.string   "payer_email",       :null => false
    t.string   "last_name",         :null => false
    t.string   "first_name",        :null => false
    t.string   "payment_status",    :null => false
    t.string   "residence_country", :null => false
    t.string   "verify",            :null => false
    t.text     "notified_json",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "receipt_id"
    t.string   "payer_id"
    t.text     "memo"
  end

  create_table "product_items", :force => true do |t|
    t.string   "item_code",                         :null => false
    t.integer  "unit_price",                        :null => false
    t.integer  "stock",          :default => 0,     :null => false
    t.integer  "ruby_kaigi_id",                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "open_sale_at"
    t.boolean  "ready_for_sale", :default => false, :null => false
  end

  add_index "product_items", ["item_code"], :name => "index_product_items_on_item_code", :unique => true

  create_table "ruby_kaigis", :force => true do |t|
    t.integer  "year",                                :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "capacity",             :default => 0, :null => false
    t.integer  "party_capacity",       :default => 0, :null => false
    t.datetime "registration_open_at"
  end

  add_index "ruby_kaigis", ["year"], :name => "index_ruby_kaigis_on_year", :unique => true

  create_table "rubyists", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "twitter_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identity_url"
    t.string   "full_name"
    t.string   "website"
    t.string   "avatar_type",     :default => "default", :null => false
  end

  add_index "rubyists", ["identity_url"], :name => "index_rubyists_on_identity_url", :unique => true
  add_index "rubyists", ["twitter_user_id"], :name => "index_rubyists_on_twitter_user_id", :unique => true
  add_index "rubyists", ["username"], :name => "index_rubyists_on_username", :unique => true

  create_table "talk_descriptions", :force => true do |t|
    t.text     "title"
    t.text     "abstract"
    t.text     "speaker"
    t.text     "profile"
    t.string   "locale",     :null => false
    t.integer  "talk_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talks", :force => true do |t|
    t.integer  "year"
    t.string   "room"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.string   "email",           :null => false
    t.text     "nicovideo_links"
    t.string   "material_link"
  end

end
