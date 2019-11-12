# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_191_112_092_417) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'activities', force: :cascade do |t|
    t.string 'activity'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'fertilizers', force: :cascade do |t|
    t.string 'fertilizer_name'
    t.date 'date_bought'
    t.integer 'quantity'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'garden_fertilizers', force: :cascade do |t|
    t.integer 'quantity_applied'
    t.date 'date_applied'
    t.string 'notes'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'garden_id'
    t.integer 'fertilizer_id'
  end

  create_table 'gardens', force: :cascade do |t|
    t.string 'plant_name'
    t.date 'date_planted'
    t.integer 'rows'
    t.integer 'spacing'
    t.string 'notes'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'locations', force: :cascade do |t|
    t.string 'address'
    t.float 'latitude'
    t.float 'longitude'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'visited_by'
  end

  create_table 'posts', force: :cascade do |t|
    t.text 'title'
    t.text 'body'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'admin', default: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'garden_fertilizers', 'fertilizers'
  add_foreign_key 'garden_fertilizers', 'gardens'
  add_foreign_key 'posts', 'users'
end
