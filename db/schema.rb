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

ActiveRecord::Schema.define(version: 20_200_928_182_505) do
  create_table 'invasive_species', force: :cascade do |t|
    t.string 'common_name'
    t.string 'photo'
    t.string 'description'
    t.string 'environment'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'species_name'
    t.string 'description'
    t.string 'location_latitude'
    t.string 'location_longitude'
    t.string 'photo'
    t.integer 'invasive_species_id'
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'username'
    t.string 'about_me'
    t.string 'password_digest'
    t.string 'location'
    t.boolean 'admin', default: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
