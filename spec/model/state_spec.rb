require 'rails_helper'

RSpec.describe State, type: :model do
  context "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:abbreviation)}
    it { should validate_presence_of(:picture_url)}
    it { should validate_presence_of(:radar_url)}
    it { should validate_presence_of(:twitter_url)}

    it { should validate_uniqueness_of(:name)}
    it { should validate_uniqueness_of(:abbreviation)}
    it { should validate_uniqueness_of(:picture_url)}
    it { should validate_uniqueness_of(:radar_url)}
    it { should validate_uniqueness_of(:twitter_url)}
  end

  context "relationships" do
    it { should have_many(:resorts) }
  end

  describe "all_states" do
    attr_reader :created_states

    before(:each) do
      ohio = Fabricate(:state, id:1, name:"Ohio", abbreviation: "OH", picture_url: "https://s3-us-west-2.amazonaws.com/snowstake/states/colorado-black-state-shape-md.png", twitter_url: "https://twitter.com/ColoradoDOT?ref_src=twsrc%5Etfw" , radar_url:"https://radar.weather.gov/ridge/lite/N0R/FTG_loop.gif?854")
      mississippi = Fabricate(:state, id:2, name:"Mississippi", abbreviation: "MS", picture_url: "https://s3-us-west-2.amazonaws.com/snowstake/states/ut-outline.png" , twitter_url:"https://twitter.com/UDOTRegionTwo?ref_src=twsrc%5Etfw", radar_url: "https://radar.weather.gov/ridge/lite/N0R/MTX_loop.gif" )
      @created_states = [mississippi, ohio]
    end

    Rails.cache.clear

    it "returns all states in alphabetical order" do
      states = State.all_states

      expect(states.count).to eq(2)

      states.each_with_index do |state, index|
        created_state = @created_states[index]

        expect(state.id).to           eq(created_state.id)
        expect(state.name).to         eq(created_state.name)
        expect(state.abbreviation).to eq(created_state.abbreviation)
        expect(state.picture_url).to  eq(created_state.picture_url)
        expect(state.twitter_url).to  eq(created_state.twitter_url)
        expect(state.radar_url).to    eq(created_state.radar_url)

        expect(state.id).to_not           eq(3)
        expect(state.name).to_not         eq("Hamilton")
        expect(state.abbreviation).to_not eq("JP")
        expect(state.picture_url).to_not  eq("www.google.com")
        expect(state.twitter_url).to_not  eq("www.twitter.com/hamilton")
        expect(state.radar_url).to_not    eq("www.hamilton-radar.com")
      end
    end
  end

  describe "find_state_by_name" do
    attr_reader :created_states

    before(:each) do
      ohio = Fabricate(:state, id:1, name:"Ohio", abbreviation: "OH", picture_url: "https://s3-us-west-2.amazonaws.com/snowstake/states/colorado-black-state-shape-md.png", twitter_url: "https://twitter.com/ColoradoDOT?ref_src=twsrc%5Etfw" , radar_url:"https://radar.weather.gov/ridge/lite/N0R/FTG_loop.gif?854")
      mississippi = Fabricate(:state, id:2, name:"Mississippi", abbreviation: "MS", picture_url: "https://s3-us-west-2.amazonaws.com/snowstake/states/ut-outline.png" , twitter_url:"https://twitter.com/UDOTRegionTwo?ref_src=twsrc%5Etfw", radar_url: "https://radar.weather.gov/ridge/lite/N0R/MTX_loop.gif" )
      @created_states = [mississippi, ohio]
    end

    Rails.cache.clear

    it "returns state by name" do
      @created_states.each do |state|
        returned_state = State.find_state_by_name(state.name)

        expect(returned_state.id).to           eq(state.id)
        expect(returned_state.name).to         eq(state.name)
        expect(returned_state.abbreviation).to eq(state.abbreviation)
        expect(returned_state.picture_url).to  eq(state.picture_url)
        expect(returned_state.twitter_url).to  eq(state.twitter_url)
        expect(returned_state.radar_url).to    eq(state.radar_url)

        expect(returned_state.id).to_not           eq(3)
        expect(returned_state.name).to_not         eq("Hamilton")
        expect(returned_state.abbreviation).to_not eq("JP")
        expect(returned_state.picture_url).to_not  eq("www.google.com")
        expect(returned_state.twitter_url).to_not  eq("www.twitter.com/hamilton")
        expect(returned_state.radar_url).to_not    eq("www.hamilton-radar.com")
      end
    end
  end

  describe "find_resorts" do
    attr_reader :all_data

    before(:each) do
      ohio = Fabricate(:state, id:1, name:"Ohio", abbreviation: "OH", picture_url: "https://s3-us-west-2.amazonaws.com/snowstake/states/colorado-black-state-shape-md.png", twitter_url: "https://twitter.com/ColoradoDOT?ref_src=twsrc%5Etfw" , radar_url:"https://radar.weather.gov/ridge/lite/N0R/FTG_loop.gif?854")
      mississippi = Fabricate(:state, id:2, name:"Mississippi", abbreviation: "MS", picture_url: "https://s3-us-west-2.amazonaws.com/snowstake/states/ut-outline.png" , twitter_url:"https://twitter.com/UDOTRegionTwo?ref_src=twsrc%5Etfw", radar_url: "https://radar.weather.gov/ridge/lite/N0R/MTX_loop.gif" )
      states = [mississippi, ohio]

      boston_mills = Fabricate(:resort, id:1, name: "Boston Mills", snowstake_url:"https://www.arapahoebasin.com/webcams/abasincam6000m.jpg", open_snow_id:"3", state_id: 1)
      ham_hills    = Fabricate(:resort, id:2, name: "Ham Hills", snowstake_url:"https://www.aspensnowmass.com/CamImages/Snow_Stake_Cam.jpg", open_snow_id:"4", state_id: 1)
      miss_mills   = Fabricate(:resort, id:3, name: "Miss Mills", snowstake_url:"http://common.snow.com/Mtncams/bcsnowstake.jpg", open_snow_id:"2", state_id: 2)
      resorts = [boston_mills, ham_hills, miss_mills]

      boston_mills_forecast  = Fabricate(:forecast, id:1, resort_id: 1)
      ham_hills_forecast     = Fabricate(:forecast, id:2, resort_id: 2)
      miss_mills_forecast    = Fabricate(:forecast, id:3, resort_id: 3)
      forecasts = [boston_mills_forecast, ham_hills_forecast, miss_mills_forecast]

      @all_data = [[ohio, [boston_mills, ham_hills], [boston_mills_forecast, ham_hills_forecast]],
                  [mississippi, [miss_mills], [miss_mills_forecast]]]
    end

    Rails.cache.clear

    it "returns all state resorts and forecasts" do
      @all_data.each do |entry|
        state     = entry[0]
        resorts   = entry[1]
        forecasts = entry[2]

        response = State.find_resorts(state.name)

        expect(response.first[0]).to eq(state.name)
        state_info = response["#{state.name}"]

        expect(state_info[:twitter]).to       eq(state.twitter_url)
        expect(state_info[:radar]).to         eq(state.radar_url)
        expect(state_info[:resorts].count).to eq(resorts.count)

        state_info[:resorts].each_with_index do |resort, index|
          created_resort   = resorts[index]
          created_forecast = forecasts[index]

          expect(resort["id"]).to            eq(created_resort.id)
          expect(resort["name"]).to          eq(created_resort.name)
          expect(resort["snowstake_url"]).to eq(created_resort.snowstake_url)
          expect(resort["open_snow_id"]).to  eq(created_resort.open_snow_id)
          expect(resort["state_id"]).to      eq(created_resort.state_id)

          expect(resort["current_temp"]).to       eq(created_forecast.current_temp)
          expect(resort["current_wind_dir"]).to   eq(created_forecast.current_wind_dir)
          expect(resort["current_wind_speed"]).to eq(created_forecast.current_wind_speed)

          expect(resort["period_one_dow"]).to              eq(created_forecast.period_one_dow)
          expect(resort["period_one_date"]).to             eq(created_forecast.period_one_date)
          expect(resort["period_one_day_snow"]).to         eq(created_forecast.period_one_day_snow)
          expect(resort["period_one_day_weather"]).to      eq(created_forecast.period_one_day_weather)
          expect(resort["period_one_day_wind_speed"]).to   eq(created_forecast.period_one_day_wind_speed)
          expect(resort["period_one_day_wind_dir"]).to     eq(created_forecast.period_one_day_wind_dir)
          expect(resort["period_one_day_temp"]).to         eq(created_forecast.period_one_day_temp)
          expect(resort["period_one_night_snow"]).to       eq(created_forecast.period_one_night_snow)
          expect(resort["period_one_night_weather"]).to    eq(created_forecast.period_one_night_weather)
          expect(resort["period_one_night_wind_speed"]).to eq(created_forecast.period_one_night_wind_speed)
          expect(resort["period_one_night_wind_dir"]).to   eq(created_forecast.period_one_night_wind_dir)
          expect(resort["period_one_night_temp"]).to       eq(created_forecast.period_one_night_temp)

          expect(resort["period_two_dow"]).to              eq(created_forecast.period_two_dow)
          expect(resort["period_two_date"]).to             eq(created_forecast.period_two_date)
          expect(resort["period_two_day_snow"]).to         eq(created_forecast.period_two_day_snow)
          expect(resort["period_two_day_weather"]).to      eq(created_forecast.period_two_day_weather)
          expect(resort["period_two_day_wind_speed"]).to   eq(created_forecast.period_two_day_wind_speed)
          expect(resort["period_two_day_wind_dir"]).to     eq(created_forecast.period_two_day_wind_dir)
          expect(resort["period_two_day_temp"]).to         eq(created_forecast.period_two_day_temp)
          expect(resort["period_two_night_snow"]).to       eq(created_forecast.period_two_night_snow)
          expect(resort["period_two_night_weather"]).to    eq(created_forecast.period_two_night_weather)
          expect(resort["period_two_night_wind_speed"]).to eq(created_forecast.period_two_night_wind_speed)
          expect(resort["period_two_night_wind_dir"]).to   eq(created_forecast.period_two_night_wind_dir)
          expect(resort["period_two_night_temp"]).to       eq(created_forecast.period_two_night_temp)

          expect(resort["period_three_dow"]).to              eq(created_forecast.period_three_dow)
          expect(resort["period_three_date"]).to             eq(created_forecast.period_three_date)
          expect(resort["period_three_day_snow"]).to         eq(created_forecast.period_three_day_snow)
          expect(resort["period_three_day_weather"]).to      eq(created_forecast.period_three_day_weather)
          expect(resort["period_three_day_wind_speed"]).to   eq(created_forecast.period_three_day_wind_speed)
          expect(resort["period_three_day_wind_dir"]).to     eq(created_forecast.period_three_day_wind_dir)
          expect(resort["period_three_day_temp"]).to         eq(created_forecast.period_three_day_temp)
          expect(resort["period_three_night_snow"]).to       eq(created_forecast.period_three_night_snow)
          expect(resort["period_three_night_weather"]).to    eq(created_forecast.period_three_night_weather)
          expect(resort["period_three_night_wind_speed"]).to eq(created_forecast.period_three_night_wind_speed)
          expect(resort["period_three_night_wind_dir"]).to   eq(created_forecast.period_three_night_wind_dir)
          expect(resort["period_three_night_temp"]).to       eq(created_forecast.period_three_night_temp)

          expect(resort["period_four_dow"]).to              eq(created_forecast.period_four_dow)
          expect(resort["period_four_date"]).to             eq(created_forecast.period_four_date)
          expect(resort["period_four_day_snow"]).to         eq(created_forecast.period_four_day_snow)
          expect(resort["period_four_day_weather"]).to      eq(created_forecast.period_four_day_weather)
          expect(resort["period_four_day_wind_speed"]).to   eq(created_forecast.period_four_day_wind_speed)
          expect(resort["period_four_day_wind_dir"]).to     eq(created_forecast.period_four_day_wind_dir)
          expect(resort["period_four_day_temp"]).to         eq(created_forecast.period_four_day_temp)
          expect(resort["period_four_night_snow"]).to       eq(created_forecast.period_four_night_snow)
          expect(resort["period_four_night_weather"]).to    eq(created_forecast.period_four_night_weather)
          expect(resort["period_four_night_wind_speed"]).to eq(created_forecast.period_four_night_wind_speed)
          expect(resort["period_four_night_wind_dir"]).to   eq(created_forecast.period_four_night_wind_dir)
          expect(resort["period_four_night_temp"]).to       eq(created_forecast.period_four_night_temp)

          expect(resort["period_five_dow"]).to              eq(created_forecast.period_five_dow)
          expect(resort["period_five_date"]).to             eq(created_forecast.period_five_date)
          expect(resort["period_five_day_snow"]).to         eq(created_forecast.period_five_day_snow)
          expect(resort["period_five_day_weather"]).to      eq(created_forecast.period_five_day_weather)
          expect(resort["period_five_day_wind_speed"]).to   eq(created_forecast.period_five_day_wind_speed)
          expect(resort["period_five_day_wind_dir"]).to     eq(created_forecast.period_five_day_wind_dir)
          expect(resort["period_five_day_temp"]).to         eq(created_forecast.period_five_day_temp)
          expect(resort["period_five_night_snow"]).to       eq(created_forecast.period_five_night_snow)
          expect(resort["period_five_night_weather"]).to    eq(created_forecast.period_five_night_weather)
          expect(resort["period_five_night_wind_speed"]).to eq(created_forecast.period_five_night_wind_speed)
          expect(resort["period_five_night_wind_dir"]).to   eq(created_forecast.period_five_night_wind_dir)
          expect(resort["period_five_night_temp"]).to       eq(created_forecast.period_five_night_temp)
        end
      end
    end
  end
end
