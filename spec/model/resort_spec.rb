require 'rails_helper'

RSpec.describe Resort, type: :model do
  context "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:snowstake_url)}
    it { should validate_presence_of(:open_snow_id)}

    it { should validate_uniqueness_of(:name)}
    it { should validate_uniqueness_of(:snowstake_url)}
    it { should validate_uniqueness_of(:open_snow_id)}
  end

  context "relationships" do
    it { should have_one(:forecast) }
    it { should belong_to(:state) }
  end

  describe "find_by_name" do
    attr_reader :resorts

    before(:each) do
      ohio = Fabricate(:state, id:1, name:"Ohio", abbreviation: "OH", picture_url: "https://s3-us-west-2.amazonaws.com/snowstake/states/colorado-black-state-shape-md.png", twitter_url: "https://twitter.com/ColoradoDOT?ref_src=twsrc%5Etfw" , radar_url:"https://radar.weather.gov/ridge/lite/N0R/FTG_loop.gif?854")
      mississippi = Fabricate(:state, id:2, name:"Mississippi", abbreviation: "MS", picture_url: "https://s3-us-west-2.amazonaws.com/snowstake/states/ut-outline.png" , twitter_url:"https://twitter.com/UDOTRegionTwo?ref_src=twsrc%5Etfw", radar_url: "https://radar.weather.gov/ridge/lite/N0R/MTX_loop.gif" )

      boston_mills = Fabricate(:resort, id:1, name: "Boston Mills", snowstake_url:"https://www.arapahoebasin.com/webcams/abasincam6000m.jpg", open_snow_id:"3", state_id: 1)
      ham_hills    = Fabricate(:resort, id:2, name: "Ham Hills", snowstake_url:"https://www.aspensnowmass.com/CamImages/Snow_Stake_Cam.jpg", open_snow_id:"4", state_id: 1)
      miss_mills   = Fabricate(:resort, id:3, name: "Miss Mills", snowstake_url:"http://common.snow.com/Mtncams/bcsnowstake.jpg", open_snow_id:"2", state_id: 2)
      @resorts = [boston_mills, ham_hills, miss_mills]

      boston_mills_forecast  = Fabricate(:forecast, id:1, resort_id: 1)
      ham_hills_forecast     = Fabricate(:forecast, id:2, resort_id: 2)
      miss_mills_forecast    = Fabricate(:forecast, id:3, resort_id: 3)
    end

    Rails.cache.clear

    it "returns a resort instance from a resort name" do
      @resorts.each do |resort|
        returned_resort = Resort.find_by_name(resort.name)

        expect(returned_resort.id).to           eq(resort.id)
        expect(returned_resort.name).to         eq(resort.name)
        expect(returned_resort.open_snow_id).to eq(resort.open_snow_id)
        expect(returned_resort.state_id).to     eq(resort.state_id)

        expect(returned_resort.id).to_not           eq(5000)
        expect(returned_resort.name).to_not         eq('jabrony')
        expect(returned_resort.open_snow_id).to_not eq('5001')
        expect(returned_resort.state_id).to_not     eq(5002)
      end
    end
  end

  describe "retrieve_all_data" do
    attr_reader :resorts, :forecasts

    before(:each) do
      ohio = Fabricate(:state, id:1, name:"Ohio", abbreviation: "OH", picture_url: "https://s3-us-west-2.amazonaws.com/snowstake/states/colorado-black-state-shape-md.png", twitter_url: "https://twitter.com/ColoradoDOT?ref_src=twsrc%5Etfw" , radar_url:"https://radar.weather.gov/ridge/lite/N0R/FTG_loop.gif?854")
      mississippi = Fabricate(:state, id:2, name:"Mississippi", abbreviation: "MS", picture_url: "https://s3-us-west-2.amazonaws.com/snowstake/states/ut-outline.png" , twitter_url:"https://twitter.com/UDOTRegionTwo?ref_src=twsrc%5Etfw", radar_url: "https://radar.weather.gov/ridge/lite/N0R/MTX_loop.gif" )

      boston_mills = Fabricate(:resort, id:1, name: "Boston Mills", snowstake_url:"https://www.arapahoebasin.com/webcams/abasincam6000m.jpg", open_snow_id:"3", state_id: 1)
      ham_hills    = Fabricate(:resort, id:2, name: "Ham Hills", snowstake_url:"https://www.aspensnowmass.com/CamImages/Snow_Stake_Cam.jpg", open_snow_id:"4", state_id: 1)
      miss_mills   = Fabricate(:resort, id:3, name: "Miss Mills", snowstake_url:"http://common.snow.com/Mtncams/bcsnowstake.jpg", open_snow_id:"2", state_id: 2)
      @resorts = [boston_mills, ham_hills, miss_mills]

      boston_mills_forecast  = Fabricate(:forecast, id:1, resort_id: 1)
      ham_hills_forecast     = Fabricate(:forecast, id:2, resort_id: 2)
      miss_mills_forecast    = Fabricate(:forecast, id:3, resort_id: 3)
      @forecasts = [boston_mills_forecast, ham_hills_forecast, miss_mills_forecast]
    end

    Rails.cache.clear

    it "returns both a resort instance and its one forecast" do
      @resorts.each_with_index do |resort, index|
        forecast = @forecasts[index]
        resort_and_forecast = Resort.retrieve_all_data(resort.name)

        expect(resort_and_forecast["id"]).to           eq(resort.id)
        expect(resort_and_forecast["name"]).to         eq(resort.name)
        expect(resort_and_forecast["open_snow_id"]).to eq(resort.open_snow_id)
        expect(resort_and_forecast["state_id"]).to     eq(resort.state_id)

        expect(resort_and_forecast["resort_id"]).to          eq(forecast.resort_id)
        expect(resort_and_forecast["current_temp"]).to       eq(forecast.current_temp)
        expect(resort_and_forecast["current_wind_dir"]).to   eq(forecast.current_wind_dir)
        expect(resort_and_forecast["current_wind_speed"]).to eq(forecast.current_wind_speed)

        expect(resort_and_forecast["period_one_dow"]).to          eq(forecast.period_one_dow)
        expect(resort_and_forecast["period_one_date"]).to         eq(forecast.period_one_date)
        expect(resort_and_forecast["period_one_day_snow"]).to     eq(forecast.period_one_day_snow)
        expect(resort_and_forecast["period_one_day_weather"]).to  eq(forecast.period_one_day_weather)
        expect(resort_and_forecast["period_one_day_wind_dir"]).to eq(forecast.period_one_day_wind_dir)
        expect(resort_and_forecast["period_one_day_temp"]).to     eq(forecast.period_one_day_temp)
        expect(resort_and_forecast["period_one_night_snow"]).to     eq(forecast.period_one_night_snow)
        expect(resort_and_forecast["period_one_night_weather"]).to  eq(forecast.period_one_night_weather)
        expect(resort_and_forecast["period_one_night_wind_dir"]).to eq(forecast.period_one_night_wind_dir)
        expect(resort_and_forecast["period_one_night_temp"]).to     eq(forecast.period_one_night_temp)

        expect(resort_and_forecast["period_two_dow"]).to          eq(forecast.period_two_dow)
        expect(resort_and_forecast["period_two_date"]).to         eq(forecast.period_two_date)
        expect(resort_and_forecast["period_two_day_snow"]).to     eq(forecast.period_two_day_snow)
        expect(resort_and_forecast["period_two_day_weather"]).to  eq(forecast.period_two_day_weather)
        expect(resort_and_forecast["period_two_day_wind_dir"]).to eq(forecast.period_two_day_wind_dir)
        expect(resort_and_forecast["period_two_day_temp"]).to     eq(forecast.period_two_day_temp)
        expect(resort_and_forecast["period_two_night_snow"]).to     eq(forecast.period_two_night_snow)
        expect(resort_and_forecast["period_two_night_weather"]).to  eq(forecast.period_two_night_weather)
        expect(resort_and_forecast["period_two_night_wind_dir"]).to eq(forecast.period_two_night_wind_dir)
        expect(resort_and_forecast["period_two_night_temp"]).to     eq(forecast.period_two_night_temp)

        expect(resort_and_forecast["period_three_dow"]).to          eq(forecast.period_three_dow)
        expect(resort_and_forecast["period_three_date"]).to         eq(forecast.period_three_date)
        expect(resort_and_forecast["period_three_day_snow"]).to     eq(forecast.period_three_day_snow)
        expect(resort_and_forecast["period_three_day_weather"]).to  eq(forecast.period_three_day_weather)
        expect(resort_and_forecast["period_three_day_wind_dir"]).to eq(forecast.period_three_day_wind_dir)
        expect(resort_and_forecast["period_three_day_temp"]).to     eq(forecast.period_three_day_temp)
        expect(resort_and_forecast["period_three_night_snow"]).to     eq(forecast.period_three_night_snow)
        expect(resort_and_forecast["period_three_night_weather"]).to  eq(forecast.period_three_night_weather)
        expect(resort_and_forecast["period_three_night_wind_dir"]).to eq(forecast.period_three_night_wind_dir)
        expect(resort_and_forecast["period_three_night_temp"]).to     eq(forecast.period_three_night_temp)

        expect(resort_and_forecast["period_four_dow"]).to          eq(forecast.period_four_dow)
        expect(resort_and_forecast["period_four_date"]).to         eq(forecast.period_four_date)
        expect(resort_and_forecast["period_four_day_snow"]).to     eq(forecast.period_four_day_snow)
        expect(resort_and_forecast["period_four_day_weather"]).to  eq(forecast.period_four_day_weather)
        expect(resort_and_forecast["period_four_day_wind_dir"]).to eq(forecast.period_four_day_wind_dir)
        expect(resort_and_forecast["period_four_day_temp"]).to     eq(forecast.period_four_day_temp)
        expect(resort_and_forecast["period_four_night_snow"]).to     eq(forecast.period_four_night_snow)
        expect(resort_and_forecast["period_four_night_weather"]).to  eq(forecast.period_four_night_weather)
        expect(resort_and_forecast["period_four_night_wind_dir"]).to eq(forecast.period_four_night_wind_dir)
        expect(resort_and_forecast["period_four_night_temp"]).to     eq(forecast.period_four_night_temp)

        expect(resort_and_forecast["period_five_dow"]).to          eq(forecast.period_five_dow)
        expect(resort_and_forecast["period_five_date"]).to         eq(forecast.period_five_date)
        expect(resort_and_forecast["period_five_day_snow"]).to     eq(forecast.period_five_day_snow)
        expect(resort_and_forecast["period_five_day_weather"]).to  eq(forecast.period_five_day_weather)
        expect(resort_and_forecast["period_five_day_wind_dir"]).to eq(forecast.period_five_day_wind_dir)
        expect(resort_and_forecast["period_five_day_temp"]).to     eq(forecast.period_five_day_temp)
        expect(resort_and_forecast["period_five_night_snow"]).to     eq(forecast.period_five_night_snow)
        expect(resort_and_forecast["period_five_night_weather"]).to  eq(forecast.period_five_night_weather)
        expect(resort_and_forecast["period_five_night_wind_dir"]).to eq(forecast.period_five_night_wind_dir)
        expect(resort_and_forecast["period_five_night_temp"]).to     eq(forecast.period_five_night_temp)


      end
    end
  end
end
