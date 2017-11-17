class Seed
  def self.start
    seed = Seed.new
    seed.destroy_data
    seed.seed_states
    seed.seed_resorts
    seed.seed_forecasts
  end

  def initialize
    @resorts = [
      [1, "Arapahoe Basin", "https://www.arapahoebasin.com/webcams/abasincam6000m.jpg", "2", 1],
      [2, "Aspen Snowmass", "https://www.aspensnowmass.com/CamImages/Snow_Stake_Cam.jpg", "24", 1],
      [3, "Beaver Creek", "http://common.snow.com/Mtncams/bcsnowstake.jpg", "5", 1],
      [4, "Breckenridge", "http://common.snow.com/Mtncams/brecksnowstake.jpg", "6", 1],
      [5, "Copper Mountain","https://b7b.hdrelay.com/cameras/fb469125-f1f3-459f-aeb4-98cb674e395f/GetOneShot?size=800x450&f=300000", "7", 1],
      [6, "Crested Butte","http://skicb.server310.com/ftp/powcam/pow.jpg", "8", 1],
      [7, "Keystone","http://common.snow.com/Mtncams/KeySnowStake.jpg", "3", 1],
      [8, "Loveland","http://photosskiloveland.com/Report/15minutes/data.jpg", "1", 1],
      [9, "Powderhorn", "http://www.powderhorn.com/cams/netcam1-000001.jpg", "12", 1],
      [10, "Steamboat","https://b7b.hdrelay.com/cameras/e12dbfe2-9359-4b93-a8ce-b5e461b681d1/GetOneShot?size=1920x1080&f=300000", "13", 1],
      [11, "Telluride","http://www.tellurideskiresort.com/webcams/powcam.jpg", "14", 1],
      [12, "Vail","http://common.snow.com/Mtncams/vailsnowstake.jpg", "15", 1],
      [13, "Winter Park","http://cams.winterparkresort.com/snow-stake-cam.jpg", "16", 1],
    ]
    @api_key = ENV["open_snow_key"]
    @states =
    [
      [1, "Colorado", "CO", "https://s3-us-west-2.amazonaws.com/snowstake/states/colorado-black-state-shape-md.png"],
      [2, "California", "CA", "https://s3-us-west-2.amazonaws.com/snowstake/states/black-cali-md.png"],
      [3, "Utah", "UT", "https://s3-us-west-2.amazonaws.com/snowstake/states/ut-outline.png"]
    ]
  end

  def destroy_data
    Resort.destroy_all
    Forecast.destroy_all
    State.destroy_all
  end

  # States Seed
  def seed_states
    @states.each do |id, state, abbreviation, picture|
      State.create(id: id, name: state, abbreviation: abbreviation, picture_url: picture)
    end
  end

  # Resorts Seed
  def seed_resorts
    @resorts.each do |resort|
      Resort.create(id: resort[0], name: resort[1], snowstake_url: resort[2], open_snow_id: resort[3], state_id: resort[4])
      puts "created #{resort[1]}"
    end
  end

  # Forecasts Seed
  def seed_forecasts
    forecasts = get_forecasts
    forecasts.each do |forecast|
    resort = Resort.find_by(open_snow_id: forecast[1][:meta][:location_id])
    resort.create_forecast(
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

Seed.start
