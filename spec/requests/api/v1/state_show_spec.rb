require 'rails_helper'

describe "states API" do
  attr_reader :boston_mills, :ham_hills, :miss_mills, :boston_mills_forecast, :ham_hills_forecast, :miss_mills_forecast, :state

  before(:each) do
    ohio = Fabricate(:state, id:1, name:"Ohio", abbreviation: "OH", picture_url: "www.ohio.com", twitter_url: "www.ohiotwitter.com", radar_url:"www.ohioradar.com")
    mississippi = Fabricate(:state, id:2, name:"Mississippi", abbreviation: "MS", picture_url: "www.mississippi.com", twitter_url:"www.mississippitwitter.com", radar_url: "www.mississippiradar.com")

    @boston_mills = Fabricate(:resort, id:1, name: "Boston Mills", snowstake_url:"www.ohioflag.com", open_snow_id:"3", state_id: 1)
    @ham_hills    = Fabricate(:resort, id:2, name: "Ham Hills", snowstake_url:"www.hamhills.com", open_snow_id:"4", state_id: 1)
    @miss_mills   = Fabricate(:resort, id:3, name: "Miss Mills", snowstake_url:"www.missmill.com", open_snow_id:"2", state_id: 2)

    @boston_mills_forecast  = Fabricate(:forecast, id:1, resort_id: 1)
    @ham_hills_forecast     = Fabricate(:forecast, id:2, resort_id: 2)
    @miss_mills_forecast    = Fabricate(:forecast, id:3, resort_id: 3)

    Rails.cache.clear

    get '/api/v1/states/Ohio'

    expect(response).to be_success

    state                 = JSON.parse(response.body)
    @state                 = state["Ohio"]
  end

  it "returns state twitter url" do
    twitter_url = @state["twitter"]
    expect(twitter_url).to      eq("www.ohiotwitter.com")
    expect(twitter_url).to_not  eq("www.missippitwitter.com")
    expect(twitter_url).to_not  eq("www.alabamatwitter.com")
  end

  it "returns state radar url" do
    radar_url             = @state["radar"]
    expect(radar_url).to      eq("www.ohioradar.com")
    expect(radar_url).to_not  eq("www.missippiradar.com")
    expect(radar_url).to_not  eq("www.alabamaradar.com")
  end

  it "returns state resorts" do
    resorts_and_forecasts = @state["resorts"]
    expect(resorts_and_forecasts.count).to  eq(2)
    expect(resorts_and_forecasts[0]["id"]).to eq(boston_mills.id)
    expect(resorts_and_forecasts[0]["state_id"]).to eq(boston_mills.state_id)
    expect(resorts_and_forecasts[0]["snowstake_url"]).to eq(boston_mills.snowstake_url)
    expect(resorts_and_forecasts[0]["open_snow_id"]).to eq(boston_mills.open_snow_id)
  end

  it "returns state resorts forecast" do
    resorts_and_forecasts = @state["resorts"]
    expect(resorts_and_forecasts[0]["resort_id"]).to eq(boston_mills_forecast.resort_id)
    expect(resorts_and_forecasts[0]["current_temp"]).to eq(boston_mills_forecast.current_temp)
    expect(resorts_and_forecasts[0]["current_wind_dir"]).to eq(boston_mills_forecast.current_wind_dir)
    expect(resorts_and_forecasts[0]["period_one_dow"]).to eq(boston_mills_forecast.period_one_dow)
    expect(resorts_and_forecasts[0]["period_one_date"]).to eq(boston_mills_forecast.period_one_date)
    expect(resorts_and_forecasts[0]["period_one_day_snow"]).to eq(boston_mills_forecast.period_one_day_snow)
    expect(resorts_and_forecasts[0]["period_one_day_weather"]).to eq(boston_mills_forecast.period_one_day_weather)
    expect(resorts_and_forecasts[0]["period_one_day_wind_speed"]).to eq(boston_mills_forecast.period_one_day_wind_speed)
    expect(resorts_and_forecasts[0]["period_one_day_wind_dir"]).to eq(boston_mills_forecast.period_one_day_wind_dir)
    expect(resorts_and_forecasts[0]["period_one_day_temp"]).to eq(boston_mills_forecast.period_one_day_temp)
    expect(resorts_and_forecasts[0]["period_one_night_snow"]).to eq(boston_mills_forecast.period_one_night_snow)
    expect(resorts_and_forecasts[0]["period_one_night_weather"]).to eq(boston_mills_forecast.period_one_night_weather)
    expect(resorts_and_forecasts[0]["period_one_night_wind_speed"]).to eq(boston_mills_forecast.period_one_night_wind_speed)
    expect(resorts_and_forecasts[0]["period_one_night_wind_dir"]).to eq(boston_mills_forecast.period_one_night_wind_dir)
    expect(resorts_and_forecasts[0]["period_one_night_temp"]).to eq(boston_mills_forecast.period_one_night_temp)
    expect(resorts_and_forecasts[0]["period_two_dow"]).to eq(boston_mills_forecast.period_two_dow)
    expect(resorts_and_forecasts[0]["period_two_date"]).to eq(boston_mills_forecast.period_two_date)
    expect(resorts_and_forecasts[0]["period_two_day_snow"]).to eq(boston_mills_forecast.period_two_day_snow)
    expect(resorts_and_forecasts[0]["period_two_day_weather"]).to eq(boston_mills_forecast.period_two_day_weather)
    expect(resorts_and_forecasts[0]["period_two_day_wind_speed"]).to eq(boston_mills_forecast.period_two_day_wind_speed)
    expect(resorts_and_forecasts[0]["period_two_day_wind_dir"]).to eq(boston_mills_forecast.period_two_day_wind_dir)
    expect(resorts_and_forecasts[0]["period_two_day_temp"]).to eq(boston_mills_forecast.period_two_day_temp)
    expect(resorts_and_forecasts[0]["period_two_night_snow"]).to eq(boston_mills_forecast.period_two_night_snow)
    expect(resorts_and_forecasts[0]["period_two_night_weather"]).to eq(boston_mills_forecast.period_two_night_weather)
    expect(resorts_and_forecasts[0]["period_two_night_wind_speed"]).to eq(boston_mills_forecast.period_two_night_wind_speed)
    expect(resorts_and_forecasts[0]["period_two_night_wind_dir"]).to eq(boston_mills_forecast.period_two_night_wind_dir)
    expect(resorts_and_forecasts[0]["period_two_night_temp"]).to eq(boston_mills_forecast.period_two_night_temp)
    expect(resorts_and_forecasts[0]["period_three_dow"]).to eq(boston_mills_forecast.period_three_dow)
    expect(resorts_and_forecasts[0]["period_three_date"]).to eq(boston_mills_forecast.period_three_date)
    expect(resorts_and_forecasts[0]["period_three_day_snow"]).to eq(boston_mills_forecast.period_three_day_snow)
    expect(resorts_and_forecasts[0]["period_three_day_weather"]).to eq(boston_mills_forecast.period_three_day_weather)
    expect(resorts_and_forecasts[0]["period_three_day_wind_speed"]).to eq(boston_mills_forecast.period_three_day_wind_speed)
    expect(resorts_and_forecasts[0]["period_three_day_wind_dir"]).to eq(boston_mills_forecast.period_three_day_wind_dir)
    expect(resorts_and_forecasts[0]["period_three_day_temp"]).to eq(boston_mills_forecast.period_three_day_temp)
    expect(resorts_and_forecasts[0]["period_three_night_snow"]).to eq(boston_mills_forecast.period_three_night_snow)
    expect(resorts_and_forecasts[0]["period_three_night_weather"]).to eq(boston_mills_forecast.period_three_night_weather)
    expect(resorts_and_forecasts[0]["period_three_night_wind_speed"]).to eq(boston_mills_forecast.period_three_night_wind_speed)
    expect(resorts_and_forecasts[0]["period_three_night_wind_dir"]).to eq(boston_mills_forecast.period_three_night_wind_dir)
    expect(resorts_and_forecasts[0]["period_three_night_temp"]).to eq(boston_mills_forecast.period_three_night_temp)
    expect(resorts_and_forecasts[0]["period_four_dow"]).to eq(boston_mills_forecast.period_four_dow)
    expect(resorts_and_forecasts[0]["period_four_date"]).to eq(boston_mills_forecast.period_four_date)
    expect(resorts_and_forecasts[0]["period_four_day_snow"]).to eq(boston_mills_forecast.period_four_day_snow)
    expect(resorts_and_forecasts[0]["period_four_day_weather"]).to eq(boston_mills_forecast.period_four_day_weather)
    expect(resorts_and_forecasts[0]["period_four_day_wind_speed"]).to eq(boston_mills_forecast.period_four_day_wind_speed)
    expect(resorts_and_forecasts[0]["period_four_day_wind_dir"]).to eq(boston_mills_forecast.period_four_day_wind_dir)
    expect(resorts_and_forecasts[0]["period_four_day_temp"]).to eq(boston_mills_forecast.period_four_day_temp)
    expect(resorts_and_forecasts[0]["period_four_night_snow"]).to eq(boston_mills_forecast.period_four_night_snow)
    expect(resorts_and_forecasts[0]["period_four_night_weather"]).to eq(boston_mills_forecast.period_four_night_weather)
    expect(resorts_and_forecasts[0]["period_four_night_wind_speed"]).to eq(boston_mills_forecast.period_four_night_wind_speed)
    expect(resorts_and_forecasts[0]["period_four_night_wind_dir"]).to eq(boston_mills_forecast.period_four_night_wind_dir)
    expect(resorts_and_forecasts[0]["period_four_night_temp"]).to eq(boston_mills_forecast.period_four_night_temp)
    expect(resorts_and_forecasts[0]["period_five_dow"]).to eq(boston_mills_forecast.period_five_dow)
    expect(resorts_and_forecasts[0]["period_five_date"]).to eq(boston_mills_forecast.period_five_date)
    expect(resorts_and_forecasts[0]["period_five_day_snow"]).to eq(boston_mills_forecast.period_five_day_snow)
    expect(resorts_and_forecasts[0]["period_five_day_weather"]).to eq(boston_mills_forecast.period_five_day_weather)
    expect(resorts_and_forecasts[0]["period_five_day_wind_speed"]).to eq(boston_mills_forecast.period_five_day_wind_speed)
    expect(resorts_and_forecasts[0]["period_five_day_wind_dir"]).to eq(boston_mills_forecast.period_five_day_wind_dir)
    expect(resorts_and_forecasts[0]["period_five_day_temp"]).to eq(boston_mills_forecast.period_five_day_temp)
    expect(resorts_and_forecasts[0]["period_five_night_snow"]).to eq(boston_mills_forecast.period_five_night_snow)
    expect(resorts_and_forecasts[0]["period_five_night_weather"]).to eq(boston_mills_forecast.period_five_night_weather)
    expect(resorts_and_forecasts[0]["period_five_night_wind_speed"]).to eq(boston_mills_forecast.period_five_night_wind_speed)
    expect(resorts_and_forecasts[0]["period_five_night_wind_dir"]).to eq(boston_mills_forecast.period_five_night_wind_dir)
    expect(resorts_and_forecasts[0]["period_five_night_temp"]).to eq(boston_mills_forecast.period_five_night_temp)
  end
end
