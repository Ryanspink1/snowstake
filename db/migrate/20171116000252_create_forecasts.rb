class CreateForecasts < ActiveRecord::Migration[5.1]
  def change
    create_table :forecasts do |t|
      t.belongs_to :resort, index: true
      t.text :current_temp
      t.text :current_wind_dir
      t.text :current_wind_speed
      t.text :period_one_dow
      t.text :period_one_date
      t.text :period_one_day_snow
      t.text :period_one_day_weather
      t.text :period_one_day_wind_speed
      t.text :period_one_day_wind_dir
      t.text :period_one_day_temp
      t.text :period_one_night_snow
      t.text :period_one_night_weather
      t.text :period_one_night_wind_speed
      t.text :period_one_night_wind_dir
      t.text :period_one_night_temp
      t.text :period_two_dow
      t.text :period_two_date
      t.text :period_two_day_snow
      t.text :period_two_day_weather
      t.text :period_two_day_wind_speed
      t.text :period_two_day_wind_dir
      t.text :period_two_day_temp
      t.text :period_two_night_snow
      t.text :period_two_night_weather
      t.text :period_two_night_wind_speed
      t.text :period_two_night_wind_dir
      t.text :period_two_night_temp
      t.text :period_three_dow
      t.text :period_three_date
      t.text :period_three_day_snow
      t.text :period_three_day_weather
      t.text :period_three_day_wind_speed
      t.text :period_three_day_wind_dir
      t.text :period_three_day_temp
      t.text :period_three_night_snow
      t.text :period_three_night_weather
      t.text :period_three_night_wind_speed
      t.text :period_three_night_wind_dir
      t.text :period_three_night_temp
      t.text :period_four_dow
      t.text :period_four_date
      t.text :period_four_day_snow
      t.text :period_four_day_weather
      t.text :period_four_day_wind_speed
      t.text :period_four_day_wind_dir
      t.text :period_four_day_temp
      t.text :period_four_night_snow
      t.text :period_four_night_weather
      t.text :period_four_night_wind_speed
      t.text :period_four_night_wind_dir
      t.text :period_four_night_temp
      t.text :period_five_dow
      t.text :period_five_date
      t.text :period_five_day_snow
      t.text :period_five_day_weather
      t.text :period_five_day_wind_speed
      t.text :period_five_day_wind_dir
      t.text :period_five_day_temp
      t.text :period_five_night_snow
      t.text :period_five_night_weather
      t.text :period_five_night_wind_speed
      t.text :period_five_night_wind_dir
      t.text :period_five_night_temp

      t.timestamps
    end
  end
end
