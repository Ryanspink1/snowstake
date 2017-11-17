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

ActiveRecord::Schema.define(version: 20171117074740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forecasts", force: :cascade do |t|
    t.bigint "resort_id"
    t.text "current_temp"
    t.text "current_wind_dir"
    t.text "current_wind_speed"
    t.text "period_one_dow"
    t.text "period_one_date"
    t.text "period_one_day_snow"
    t.text "period_one_day_weather"
    t.text "period_one_day_wind_speed"
    t.text "period_one_day_wind_dir"
    t.text "period_one_day_temp"
    t.text "period_one_night_snow"
    t.text "period_one_night_weather"
    t.text "period_one_night_wind_speed"
    t.text "period_one_night_wind_dir"
    t.text "period_one_night_temp"
    t.text "period_two_dow"
    t.text "period_two_date"
    t.text "period_two_day_snow"
    t.text "period_two_day_weather"
    t.text "period_two_day_wind_speed"
    t.text "period_two_day_wind_dir"
    t.text "period_two_day_temp"
    t.text "period_two_night_snow"
    t.text "period_two_night_weather"
    t.text "period_two_night_wind_speed"
    t.text "period_two_night_wind_dir"
    t.text "period_two_night_temp"
    t.text "period_three_dow"
    t.text "period_three_date"
    t.text "period_three_day_snow"
    t.text "period_three_day_weather"
    t.text "period_three_day_wind_speed"
    t.text "period_three_day_wind_dir"
    t.text "period_three_day_temp"
    t.text "period_three_night_snow"
    t.text "period_three_night_weather"
    t.text "period_three_night_wind_speed"
    t.text "period_three_night_wind_dir"
    t.text "period_three_night_temp"
    t.text "period_four_dow"
    t.text "period_four_date"
    t.text "period_four_day_snow"
    t.text "period_four_day_weather"
    t.text "period_four_day_wind_speed"
    t.text "period_four_day_wind_dir"
    t.text "period_four_day_temp"
    t.text "period_four_night_snow"
    t.text "period_four_night_weather"
    t.text "period_four_night_wind_speed"
    t.text "period_four_night_wind_dir"
    t.text "period_four_night_temp"
    t.text "period_five_dow"
    t.text "period_five_date"
    t.text "period_five_day_snow"
    t.text "period_five_day_weather"
    t.text "period_five_day_wind_speed"
    t.text "period_five_day_wind_dir"
    t.text "period_five_day_temp"
    t.text "period_five_night_snow"
    t.text "period_five_night_weather"
    t.text "period_five_night_wind_speed"
    t.text "period_five_night_wind_dir"
    t.text "period_five_night_temp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resort_id"], name: "index_forecasts_on_resort_id"
  end

  create_table "resorts", force: :cascade do |t|
    t.text "name"
    t.text "snowstake_url"
    t.text "open_snow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "state_id"
    t.index ["state_id"], name: "index_resorts_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.text "name"
    t.text "abbreviation"
    t.text "picture_url"
  end

  add_foreign_key "resorts", "states"
end
