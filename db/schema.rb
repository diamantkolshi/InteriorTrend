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

ActiveRecord::Schema.define(version: 2021_09_22_212247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "parent_id"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "active", default: true
    t.bigint "nationality_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nationality_id"], name: "index_cities_on_nationality_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredient_colors", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.bigint "color_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["color_id"], name: "index_ingredient_colors_on_color_id"
    t.index ["ingredient_id"], name: "index_ingredient_colors_on_ingredient_id"
  end

  create_table "ingredient_materials", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.bigint "material_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_ingredient_materials_on_ingredient_id"
    t.index ["material_id"], name: "index_ingredient_materials_on_material_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "form_id"
    t.bigint "style_id"
    t.bigint "category_id"
    t.string "name"
    t.float "price"
    t.string "position_name"
    t.decimal "position_x"
    t.decimal "position_y"
    t.decimal "width"
    t.decimal "height"
    t.decimal "size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_ingredients_on_category_id"
    t.index ["form_id"], name: "index_ingredients_on_form_id"
    t.index ["post_id"], name: "index_ingredients_on_post_id"
    t.index ["style_id"], name: "index_ingredients_on_style_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nationalities", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "project_id"
    t.string "title"
    t.text "description"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_posts_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "city_id"
    t.string "title"
    t.text "description"
    t.string "street"
    t.string "location"
    t.integer "views"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_projects_on_city_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.string "name"
    t.string "surname"
    t.string "company_name"
    t.string "street"
    t.string "phone_number"
    t.string "website"
    t.jsonb "json_attributes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "role_id"
    t.bigint "nationality_id"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["json_attributes"], name: "index_users_on_json_attributes", using: :gin
    t.index ["nationality_id"], name: "index_users_on_nationality_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "users", "cities"
  add_foreign_key "users", "nationalities"
  add_foreign_key "users", "roles"
end
