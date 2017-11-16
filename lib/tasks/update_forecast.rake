
require 'rake'

task :update_forecast => :environment do
  class UpdateForecast

    def self.start
      updater = UpdateForecast.new
      updater.update
    end

    def initialize
      @api_key = ENV["open_snow_key"]
    end

    def update
      forecasts = get_forecasts
      forecasts.each do |forecast|
      resort = Resort.find_by(open_snow_id: forecast[1][:meta][:location_id])
      resort.forecast.update(
        current_temp:                  "#{forecast[1][:current_conditions][:temp]}",
        current_wind_dir:              "#{forecast[1][:current_conditions][:wind_dir]}",
        current_wind_speed:            "#{forecast[1][:current_conditions][:wind_speed]}",
        period_one_dow:                "#{forecast[1][:forecast][:period1][:dow]}",
        period_one_date:               "#{forecast[1][:forecast][:period1][:date]}",
        period_one_day_snow:           "#{forecast[1][:forecast][:period1][:day][:snow]}",
        period_one_day_weather:        "#{forecast[1][:forecast][:period1][:day][:weather]}",
        period_one_day_wind_speed:     "#{forecast[1][:forecast][:period1][:day][:wind_sped]}",
        period_one_day_wind_dir:       "#{forecast[1][:forecast][:period1][:day][:wind_dir]}",
        period_one_day_temp:           "#{forecast[1][:forecast][:period1][:day][:temp]}",
        period_one_night_snow:         "#{forecast[1][:forecast][:period1][:night][:snow]}",
        period_one_night_weather:      "#{forecast[1][:forecast][:period1][:night][:weather]}",
        period_one_night_wind_speed:   "#{forecast[1][:forecast][:period1][:night][:wind_speed]}",
        period_one_night_wind_dir:     "#{forecast[1][:forecast][:period1][:night][:wind_dir]}",
        period_one_night_temp:         "#{forecast[1][:forecast][:period1][:night][:temp]}",
        period_two_dow:                "#{forecast[1][:forecast][:period2][:dow]}",
        period_two_date:               "#{forecast[1][:forecast][:period2][:date]}",
        period_two_day_snow:           "#{forecast[1][:forecast][:period2][:day][:snow]}",
        period_two_day_weather:        "#{forecast[1][:forecast][:period2][:day][:weather]}",
        period_two_day_wind_speed:     "#{forecast[1][:forecast][:period2][:day][:wind_sped]}",
        period_two_day_wind_dir:       "#{forecast[1][:forecast][:period2][:day][:wind_dir]}",
        period_two_day_temp:           "#{forecast[1][:forecast][:period2][:day][:temp]}",
        period_two_night_snow:         "#{forecast[1][:forecast][:period2][:night][:snow]}",
        period_two_night_weather:      "#{forecast[1][:forecast][:period2][:night][:weather]}",
        period_two_night_wind_speed:   "#{forecast[1][:forecast][:period2][:night][:wind_speed]}",
        period_two_night_wind_dir:     "#{forecast[1][:forecast][:period2][:night][:wind_dir]}",
        period_two_night_temp:         "#{forecast[1][:forecast][:period2][:night][:temp]}",
        period_three_dow:              "#{forecast[1][:forecast][:period3][:dow]}",
        period_three_date:             "#{forecast[1][:forecast][:period3][:date]}",
        period_three_day_snow:         "#{forecast[1][:forecast][:period3][:day][:snow]}",
        period_three_day_weather:      "#{forecast[1][:forecast][:period3][:day][:weather]}",
        period_three_day_wind_speed:   "#{forecast[1][:forecast][:period3][:day][:wind_sped]}",
        period_three_day_wind_dir:     "#{forecast[1][:forecast][:period3][:day][:wind_dir]}",
        period_three_day_temp:         "#{forecast[1][:forecast][:period3][:day][:temp]}",
        period_three_night_snow:       "#{forecast[1][:forecast][:period3][:night][:snow]}",
        period_three_night_weather:    "#{forecast[1][:forecast][:period3][:night][:weather]}",
        period_three_night_wind_speed: "#{forecast[1][:forecast][:period3][:night][:wind_speed]}",
        period_three_night_wind_dir:   "#{forecast[1][:forecast][:period3][:night][:wind_dir]}",
        period_three_night_temp:       "#{forecast[1][:forecast][:period3][:night][:temp]}",
        period_four_dow:               "#{forecast[1][:forecast][:period4][:dow]}",
        period_four_date:              "#{forecast[1][:forecast][:period4][:date]}",
        period_four_day_snow:          "#{forecast[1][:forecast][:period4][:day][:snow]}",
        period_four_day_weather:       "#{forecast[1][:forecast][:period4][:day][:weather]}",
        period_four_day_wind_speed:    "#{forecast[1][:forecast][:period4][:day][:wind_sped]}",
        period_four_day_wind_dir:      "#{forecast[1][:forecast][:period4][:day][:wind_dir]}",
        period_four_day_temp:          "#{forecast[1][:forecast][:period4][:day][:temp]}",
        period_four_night_snow:        "#{forecast[1][:forecast][:period4][:night][:snow]}",
        period_four_night_weather:     "#{forecast[1][:forecast][:period4][:night][:weather]}",
        period_four_night_wind_speed:  "#{forecast[1][:forecast][:period4][:night][:wind_speed]}",
        period_four_night_wind_dir:    "#{forecast[1][:forecast][:period4][:night][:wind_dir]}",
        period_four_night_temp:        "#{forecast[1][:forecast][:period4][:night][:temp]}",
        period_five_dow:               "#{forecast[1][:forecast][:period5][:dow]}",
        period_five_date:              "#{forecast[1][:forecast][:period5][:date]}",
        period_five_day_snow:          "#{forecast[1][:forecast][:period5][:day][:snow]}",
        period_five_day_weather:       "#{forecast[1][:forecast][:period5][:day][:weather]}",
        period_five_day_wind_speed:    "#{forecast[1][:forecast][:period5][:day][:wind_sped]}",
        period_five_day_wind_dir:      "#{forecast[1][:forecast][:period5][:day][:wind_dir]}",
        period_five_day_temp:          "#{forecast[1][:forecast][:period5][:day][:temp]}",
        period_five_night_snow:        "#{forecast[1][:forecast][:period5][:night][:snow]}",
        period_five_night_weather:     "#{forecast[1][:forecast][:period5][:night][:weather]}",
        period_five_night_wind_speed:  "#{forecast[1][:forecast][:period5][:night][:wind_speed]}",
        period_five_night_wind_dir:    "#{forecast[1][:forecast][:period5][:night][:wind_dir]}",
        period_five_night_temp:        "#{forecast[1][:forecast][:period5][:night][:temp]}"
        )
      end
    end

    def get_forecasts
      conn = Faraday.new(url: "https://peaceful-beach-96299.herokuapp.com/http://opensnow.com/api/public/1.0/locations/data?apikey=#{@api_key}&lids=2,24,5,6,7,8,3,1,12,13,14,15,16&type=json", headers: {'Origin' => 'www.google.com'})
      response = conn.get
      forecasts = JSON.parse(response.body, symbolize_names: true)[:results]
      forecasts
    end
  end
  UpdateForecast.start
end
