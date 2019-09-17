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

ActiveRecord::Schema.define(version: 2019_09_16_231934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounting_accounts", force: :cascade do |t|
    t.string "account"
    t.string "name_account"
    t.integer "n"
    t.integer "t"
    t.integer "a"
    t.string "mooring_must"
    t.string "mooring_having"
    t.string "b_comp"
    t.integer "m_e"
    t.string "account_e"
    t.string "financial_entity"
    t.string "financial_account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.bigint "product_id"
    t.bigint "category_id"
    t.bigint "user_id"
    t.index ["category_id"], name: "index_accounting_accounts_on_category_id"
    t.index ["product_id"], name: "index_accounting_accounts_on_product_id"
    t.index ["user_id"], name: "index_accounting_accounts_on_user_id"
  end

  create_table "accounting_movements", force: :cascade do |t|
    t.bigint "accounting_account_id"
    t.bigint "sale_document_id"
    t.bigint "purcharse_document_id"
    t.bigint "type_origin_id"
    t.bigint "type_document_id"
    t.date "date_document"
    t.date "date_voucher"
    t.integer "coin"
    t.integer "type_amount"
    t.decimal "amount"
    t.string "identity_document"
    t.string "number_document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "business_name"
    t.integer "status", default: 1
    t.bigint "small_box_id"
    t.bigint "personal_expense_id"
    t.bigint "pay_check_id"
    t.bigint "pay_salary_id"
    t.string "concept"
    t.bigint "period_id"
    t.index ["accounting_account_id"], name: "index_accounting_movements_on_accounting_account_id"
    t.index ["pay_check_id"], name: "index_accounting_movements_on_pay_check_id"
    t.index ["pay_salary_id"], name: "index_accounting_movements_on_pay_salary_id"
    t.index ["period_id"], name: "index_accounting_movements_on_period_id"
    t.index ["personal_expense_id"], name: "index_accounting_movements_on_personal_expense_id"
    t.index ["purcharse_document_id"], name: "index_accounting_movements_on_purcharse_document_id"
    t.index ["sale_document_id"], name: "index_accounting_movements_on_sale_document_id"
    t.index ["small_box_id"], name: "index_accounting_movements_on_small_box_id"
  end

  create_table "address_data", force: :cascade do |t|
    t.string "department"
    t.string "province"
    t.string "district"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "branch_offices", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cod_branch_offices"
    t.string "address"
    t.date "opening_date"
    t.bigint "user_id"
    t.string "identity_document"
    t.string "key_factesol"
    t.string "phone"
    t.string "email"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.bigint "branch_office_id"
    t.integer "serie"
    t.integer "serie_invoice"
    t.index ["branch_office_id"], name: "index_branch_offices_on_branch_office_id"
    t.index ["user_id"], name: "index_branch_offices_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.integer "type_category"
    t.index ["category_id"], name: "index_categories_on_category_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "identity_document"
    t.string "client"
    t.text "address"
    t.string "departament"
    t.string "province"
    t.string "district"
    t.string "email"
    t.text "phone"
    t.string "contact"
    t.string "bank"
    t.string "account_number"
    t.text "aptitude"
    t.text "interest"
    t.date "opening_date"
    t.boolean "state", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coin_type"
    t.boolean "retention", default: false
    t.text "positive_balances"
  end

  create_table "exchange_rates", force: :cascade do |t|
    t.date "date"
    t.float "dollar_purchase"
    t.float "dollar_sale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_manual"
  end

  create_table "importations", force: :cascade do |t|
    t.bigint "purcharse_document_id"
    t.string "receive"
    t.date "arrival_date"
    t.string "shipping_address"
    t.string "provider"
    t.string "provider_code"
    t.decimal "cost"
    t.text "assured"
    t.text "agent_payment"
    t.text "handling"
    t.decimal "subtotal"
    t.decimal "total"
    t.text "lading"
    t.text "taxes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "other_invoices"
    t.index ["purcharse_document_id"], name: "index_importations_on_purcharse_document_id"
  end

  create_table "measurements_units", force: :cascade do |t|
    t.string "unit_code"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "abbreviation"
  end

  create_table "movement_products", force: :cascade do |t|
    t.integer "type_movement"
    t.bigint "provider_id"
    t.bigint "store_id"
    t.text "products"
    t.text "observations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document"
    t.integer "status"
    t.text "pay_mode"
    t.integer "coin"
    t.decimal "op_gravada"
    t.decimal "igv_total"
    t.decimal "total_value"
    t.integer "serie"
    t.index ["provider_id"], name: "index_movement_products_on_provider_id"
    t.index ["store_id"], name: "index_movement_products_on_store_id"
  end

  create_table "movements", force: :cascade do |t|
    t.string "concept"
    t.decimal "entry"
    t.decimal "egress"
    t.string "user_register"
    t.string "number"
    t.string "serie"
    t.string "ruc"
    t.string "bussiness_name"
    t.integer "type_document"
    t.decimal "sales_value"
    t.decimal "igv"
    t.bigint "small_box_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "document_date"
    t.string "user_delete"
    t.boolean "active"
    t.bigint "accounting_movement_id"
    t.index ["accounting_movement_id"], name: "index_movements_on_accounting_movement_id"
    t.index ["small_box_id"], name: "index_movements_on_small_box_id"
  end

  create_table "pay_checks", force: :cascade do |t|
    t.string "number"
    t.integer "coin"
    t.decimal "amount"
    t.text "concept"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 1
    t.bigint "branch_office_id"
    t.bigint "user_register_id"
    t.text "pays"
    t.string "user_check"
    t.string "identity_document"
    t.index ["branch_office_id"], name: "index_pay_checks_on_branch_office_id"
  end

  create_table "pay_salaries", force: :cascade do |t|
    t.bigint "user_id"
    t.string "nro_operation"
    t.datetime "date_register"
    t.integer "coin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "observations"
    t.decimal "amount"
    t.index ["user_id"], name: "index_pay_salaries_on_user_id"
  end

  create_table "periods", force: :cascade do |t|
    t.integer "month"
    t.integer "year"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_expenses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "user_register_id"
    t.decimal "amount"
    t.string "code"
    t.text "movements"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 1
    t.integer "coin"
    t.text "clossing_comment"
    t.index ["user_id"], name: "index_personal_expenses_on_user_id"
  end

  create_table "pre_sale_documents", force: :cascade do |t|
    t.text "products"
    t.text "observation"
    t.string "user_register"
    t.integer "status"
    t.integer "coin"
    t.decimal "sale_value"
    t.decimal "discount_total"
    t.decimal "net_value"
    t.decimal "igv_total"
    t.decimal "total_value"
    t.text "total_in_letter"
    t.bigint "sale_document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.text "customers"
    t.bigint "branch_office_id"
    t.index ["branch_office_id"], name: "index_pre_sale_documents_on_branch_office_id"
    t.index ["customer_id"], name: "index_pre_sale_documents_on_customer_id"
    t.index ["sale_document_id"], name: "index_pre_sale_documents_on_sale_document_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "measurements_unit_id"
    t.string "product_code"
    t.text "description"
    t.decimal "sale_price_dol"
    t.decimal "stock"
    t.decimal "average_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "colour"
    t.string "brand"
    t.string "meassure"
    t.string "component"
    t.string "conclude"
    t.string "principal_category"
    t.string "primary_category"
    t.string "secundary_category"
    t.decimal "sale_price_sol"
    t.decimal "purchase_price_dol"
    t.decimal "purchase_price_sol"
    t.string "name_document"
    t.index ["measurements_unit_id"], name: "index_products_on_measurements_unit_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "identity_document"
    t.string "provider"
    t.text "address"
    t.string "departament"
    t.string "province"
    t.string "district"
    t.text "email"
    t.text "phone"
    t.text "contact"
    t.text "bank"
    t.text "account_number"
    t.integer "coin_type"
    t.date "opening_date"
    t.text "aptitude"
    t.text "interest"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "products"
  end

  create_table "purcharse_documents", force: :cascade do |t|
    t.text "products"
    t.string "user_register"
    t.string "number"
    t.string "serie"
    t.string "ruc"
    t.string "bussiness_name"
    t.integer "type_document"
    t.date "document_date"
    t.string "user_delete"
    t.integer "status"
    t.text "observation"
    t.text "pay_mode_customer"
    t.integer "coin"
    t.decimal "sale_value"
    t.decimal "discount_total"
    t.decimal "net_value"
    t.decimal "igv_total"
    t.decimal "total_value"
    t.text "total_in_letter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "accounting_account"
    t.decimal "detraction"
    t.decimal "fourth_category_income"
    t.bigint "branch_office_id"
    t.bigint "purcharse_document_id"
    t.index ["branch_office_id"], name: "index_purcharse_documents_on_branch_office_id"
    t.index ["purcharse_document_id"], name: "index_purcharse_documents_on_purcharse_document_id"
  end

  create_table "purcharse_orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "provider_id"
    t.integer "state"
    t.text "product"
    t.string "pay_mode"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "atte"
    t.text "id_store_order"
    t.string "observation"
    t.decimal "sale_value_provider"
    t.decimal "discount_total_provider"
    t.decimal "net_value_provider"
    t.decimal "igv_total_provider"
    t.decimal "total_value_provider"
    t.integer "coin"
    t.text "pay_mode_provider"
    t.bigint "branch_office_id"
    t.index ["branch_office_id"], name: "index_purcharse_orders_on_branch_office_id"
    t.index ["provider_id"], name: "index_purcharse_orders_on_provider_id"
    t.index ["store_id"], name: "index_purcharse_orders_on_store_id"
    t.index ["user_id"], name: "index_purcharse_orders_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sale_documents", force: :cascade do |t|
    t.bigint "sale_document_id"
    t.bigint "customer_id"
    t.bigint "user_id"
    t.bigint "store_id"
    t.bigint "vehicle_id"
    t.string "number_document"
    t.boolean "translate_store"
    t.integer "type_document"
    t.string "startin_address"
    t.string "arrival_address"
    t.text "products"
    t.text "reason"
    t.integer "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.text "observations"
    t.text "pay_mode_customer"
    t.integer "coin"
    t.decimal "sale_value"
    t.decimal "discount_total"
    t.decimal "net_value"
    t.decimal "igv_total"
    t.decimal "total_value"
    t.text "total_in_letter"
    t.date "date_translate"
    t.bigint "branch_office_id"
    t.string "consignation_guide"
    t.integer "serie"
    t.text "documents"
    t.datetime "date_document"
    t.boolean "old", default: false
    t.index ["branch_office_id"], name: "index_sale_documents_on_branch_office_id"
    t.index ["customer_id"], name: "index_sale_documents_on_customer_id"
    t.index ["sale_document_id"], name: "index_sale_documents_on_sale_document_id"
    t.index ["store_id"], name: "index_sale_documents_on_store_id"
    t.index ["user_id"], name: "index_sale_documents_on_user_id"
    t.index ["vehicle_id"], name: "index_sale_documents_on_vehicle_id"
  end

  create_table "small_boxes", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coin"
    t.decimal "starting_amount"
    t.decimal "final_amount"
    t.string "number_box"
    t.string "user_delete"
    t.integer "state", default: 1
    t.integer "type_small_box"
    t.text "movements"
    t.index ["user_id"], name: "index_small_boxes_on_user_id"
  end

  create_table "store_orders", force: :cascade do |t|
    t.integer "number_order"
    t.bigint "user_id"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "products"
    t.index ["store_id"], name: "index_store_orders_on_store_id"
    t.index ["user_id"], name: "index_store_orders_on_user_id"
  end

  create_table "store_products", force: :cascade do |t|
    t.decimal "stock"
    t.bigint "store_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "activity"
    t.integer "rotation"
    t.decimal "minimum_stock"
    t.index ["product_id"], name: "index_store_products_on_product_id"
    t.index ["store_id"], name: "index_store_products_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.bigint "user_id"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "branch_office_id"
    t.string "name"
    t.index ["branch_office_id"], name: "index_stores_on_branch_office_id"
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "table_types", force: :cascade do |t|
    t.integer "enum_table"
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "period_id"
    t.index ["period_id"], name: "index_table_types_on_period_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "phone"
    t.string "name"
    t.datetime "date_of_birth"
    t.integer "sex"
    t.string "dni"
    t.string "position"
    t.string "lastname"
    t.date "date_of_admission"
    t.string "acount_number"
    t.string "membership"
    t.decimal "salary"
    t.decimal "household_allowance"
    t.date "departure_date"
    t.boolean "status"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "bank"
    t.boolean "first_change_password"
    t.integer "age"
    t.bigint "branch_office_id"
    t.boolean "is_driver"
    t.string "driver_licence"
    t.string "bank_cts"
    t.string "account_cts"
    t.index ["branch_office_id"], name: "index_users_on_branch_office_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.bigint "branch_office_id"
    t.string "register_office"
    t.string "license_plate"
    t.string "previous_license_plate"
    t.string "category"
    t.string "brand"
    t.string "model"
    t.string "gas"
    t.integer "gross_weight"
    t.integer "net_weight"
    t.integer "useful_load"
    t.string "title"
    t.date "date_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_office_id"], name: "index_vehicles_on_branch_office_id"
  end

  add_foreign_key "accounting_accounts", "categories"
  add_foreign_key "accounting_accounts", "products"
  add_foreign_key "accounting_accounts", "users"
  add_foreign_key "accounting_movements", "accounting_accounts"
  add_foreign_key "accounting_movements", "pay_checks"
  add_foreign_key "accounting_movements", "pay_salaries"
  add_foreign_key "accounting_movements", "periods"
  add_foreign_key "accounting_movements", "personal_expenses"
  add_foreign_key "accounting_movements", "purcharse_documents"
  add_foreign_key "accounting_movements", "sale_documents"
  add_foreign_key "accounting_movements", "small_boxes"
  add_foreign_key "branch_offices", "branch_offices"
  add_foreign_key "branch_offices", "users"
  add_foreign_key "categories", "categories"
  add_foreign_key "importations", "purcharse_documents"
  add_foreign_key "movement_products", "providers"
  add_foreign_key "movement_products", "stores"
  add_foreign_key "movements", "accounting_movements"
  add_foreign_key "movements", "small_boxes"
  add_foreign_key "pay_checks", "branch_offices"
  add_foreign_key "pay_salaries", "users"
  add_foreign_key "personal_expenses", "users"
  add_foreign_key "pre_sale_documents", "branch_offices"
  add_foreign_key "pre_sale_documents", "customers"
  add_foreign_key "pre_sale_documents", "sale_documents"
  add_foreign_key "products", "measurements_units"
  add_foreign_key "purcharse_documents", "branch_offices"
  add_foreign_key "purcharse_documents", "purcharse_documents"
  add_foreign_key "purcharse_orders", "branch_offices"
  add_foreign_key "purcharse_orders", "providers"
  add_foreign_key "purcharse_orders", "stores"
  add_foreign_key "purcharse_orders", "users"
  add_foreign_key "sale_documents", "branch_offices"
  add_foreign_key "sale_documents", "customers"
  add_foreign_key "sale_documents", "sale_documents"
  add_foreign_key "sale_documents", "stores"
  add_foreign_key "sale_documents", "users"
  add_foreign_key "sale_documents", "vehicles"
  add_foreign_key "small_boxes", "users"
  add_foreign_key "store_orders", "stores"
  add_foreign_key "store_orders", "users"
  add_foreign_key "store_products", "products"
  add_foreign_key "store_products", "stores"
  add_foreign_key "stores", "branch_offices"
  add_foreign_key "stores", "users"
  add_foreign_key "table_types", "periods"
  add_foreign_key "users", "branch_offices"
  add_foreign_key "vehicles", "branch_offices"
end
