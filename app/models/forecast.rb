class Forecast < ApplicationRecord
  belongs_to :resort

  validates :current_temp,
   :current_wind_dir,
  #  :current_wind_speed,
   :period_one_dow,
   :period_one_date,
   :period_one_day_snow,
   :period_one_day_weather,
  #  :period_one_day_wind_speed,
   :period_one_day_wind_dir,
   :period_one_day_temp,
   :period_one_night_snow,
   :period_one_night_weather,
  #  :period_one_night_wind_speed,
   :period_one_night_wind_dir,
   :period_one_night_temp,
   :period_two_dow,
   :period_two_date,
   :period_two_day_snow,
   :period_two_day_weather,
  #  :period_two_day_wind_speed,
   :period_two_day_wind_dir,
   :period_two_day_temp,
   :period_two_night_snow,
   :period_two_night_weather,
  #  :period_two_night_wind_speed,
   :period_two_night_wind_dir,
   :period_two_night_temp,
   :period_three_dow,
   :period_three_date,
   :period_three_day_snow,
   :period_three_day_weather,
  #  :period_three_day_wind_speed,
   :period_three_day_wind_dir,
   :period_three_day_temp,
   :period_three_night_snow,
   :period_three_night_weather,
  #  :period_three_night_wind_speed,
   :period_three_night_wind_dir,
   :period_three_night_temp,
   :period_four_dow,
   :period_four_date,
   :period_four_day_snow,
   :period_four_day_weather,
  #  :period_four_day_wind_speed,
   :period_four_day_wind_dir,
   :period_four_day_temp,
   :period_four_night_snow,
   :period_four_night_weather,
  #  :period_four_night_wind_speed,
   :period_four_night_wind_dir,
   :period_four_night_temp,
   :period_five_dow,
   :period_five_date,
   :period_five_day_snow,
   :period_five_day_weather,
  #  :period_five_day_wind_speed,
   :period_five_day_wind_dir,
   :period_five_day_temp,
   :period_five_night_snow,
   :period_five_night_weather,
  #  :period_five_night_wind_speed,
   :period_five_night_wind_dir,
   :period_five_night_temp,

   presence: true
end
