require 'rails_helper'

RSpec.describe PostgresConnection, type: :model do
  describe "raw_sql" do
    attr_reader :boston_mills, :ham_hills, :miss_mills, :boston_mills_forecast, :ham_hills_forecast, :miss_mills_forecast, :state, :psql

    before(:each) do
      ohio = Fabricate(:state, id:1, name:"Ohio", abbreviation: "OH", picture_url: "https://s3-us-west-2.amazonaws.com/snowstake/states/colorado-black-state-shape-md.png", twitter_url: "https://twitter.com/ColoradoDOT?ref_src=twsrc%5Etfw" , radar_url:"https://radar.weather.gov/ridge/lite/N0R/FTG_loop.gif?854")
      mississippi = Fabricate(:state, id:2, name:"Mississippi", abbreviation: "MS", picture_url: "https://s3-us-west-2.amazonaws.com/snowstake/states/ut-outline.png" , twitter_url:"https://twitter.com/UDOTRegionTwo?ref_src=twsrc%5Etfw", radar_url: "https://radar.weather.gov/ridge/lite/N0R/MTX_loop.gif" )

      @boston_mills = Fabricate(:resort, id:1, name: "Boston Mills", snowstake_url:"https://www.arapahoebasin.com/webcams/abasincam6000m.jpg", open_snow_id:"3", state_id: 1)
      @ham_hills    = Fabricate(:resort, id:2, name: "Ham Hills", snowstake_url:"https://www.aspensnowmass.com/CamImages/Snow_Stake_Cam.jpg", open_snow_id:"4", state_id: 1)
      @miss_mills   = Fabricate(:resort, id:3, name: "Miss Mills", snowstake_url:"http://common.snow.com/Mtncams/bcsnowstake.jpg", open_snow_id:"2", state_id: 2)

      @boston_mills_forecast  = Fabricate(:forecast, id:1, resort_id: 1)
      @ham_hills_forecast     = Fabricate(:forecast, id:2, resort_id: 2)
      @miss_mills_forecast    = Fabricate(:forecast, id:3, resort_id: 3)

      Rails.cache.clear
      @psql = PostgresConnection.new
    end

    it "returns STATUS:OK from valid SQL query" do
      database_return = psql.raw_sql("SELECT * FROM resorts")

      expect(database_return.result_status).to eq(2)
    end

    it "returns STATUS:EMPTY QUERY from empty SQL query" do
      database_return = psql.raw_sql("")

      expect(database_return.result_status).to eq(0)
    end

    it "returns a postgres result" do
      database_return = psql.raw_sql("SELECT * FROM resorts")
      stringified_result = database_return.inspect

      expect(stringified_result[0..11]).to eq("#<PG::Result")
    end

    it "returns correct result from valid SQL query" do
      database_return = psql.raw_sql("SELECT * FROM resorts")

      first = database_return.values[0]
      second = database_return.values[1]
      third = database_return.values[2]

      expect(first[0]).to eq(@boston_mills.id)
      expect(first[1]).to eq(@boston_mills.name)
      expect(first[2]).to eq(@boston_mills.snowstake_url)
      expect(first[3]).to eq(@boston_mills.open_snow_id)
      expect(first[6]).to eq(@boston_mills.state_id)

      expect(second[0]).to eq(@ham_hills.id)
      expect(second[1]).to eq(@ham_hills.name)
      expect(second[2]).to eq(@ham_hills.snowstake_url)
      expect(second[3]).to eq(@ham_hills.open_snow_id)
      expect(second[6]).to eq(@ham_hills.state_id)

      expect(third[0]).to eq(@miss_mills.id)
      expect(third[1]).to eq(@miss_mills.name)
      expect(third[2]).to eq(@miss_mills.snowstake_url)
      expect(third[3]).to eq(@miss_mills.open_snow_id)
      expect(third[6]).to eq(@miss_mills.state_id)

      expect(first[0]).to_not eq(@miss_mills.id)
      expect(first[1]).to_not eq(@miss_mills.name)
      expect(first[2]).to_not eq(@miss_mills.snowstake_url)
      expect(first[3]).to_not eq(@miss_mills.open_snow_id)
      expect(first[6]).to_not eq(@miss_mills.state_id)
    end
  end
end
