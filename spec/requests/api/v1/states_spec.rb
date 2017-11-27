require 'rails_helper'

describe "states API" do
  it "returns each state" do
    VCR.use_cassette("states/each_state") do
      Fabricate(:state, id:1, name:"Ohio", abbreviation: "OH", picture_url: "www.ohio.com", twitter_url: "https://twitter.com/ColoradoDOT?ref_src=twsrc%5Etfw" , radar_url:"https://radar.weather.gov/ridge/lite/N0R/FTG_loop.gif?854")
      Fabricate(:state, id:2, name:"Mississippi", abbreviation: "MS", picture_url: "www.mississippi.com", twitter_url:"https://twitter.com/UDOTRegionTwo?ref_src=twsrc%5Etfw", radar_url: "https://radar.weather.gov/ridge/lite/N0R/MTX_loop.gif" )
      Fabricate(:state, id:3, name:"Arizona", abbreviation: "AZ", picture_url: "www.arizona.com", twitter_url:"https://twitter.com/arizona", radar_url: "https://radar.weather.gov/arizona.gif" )

      get '/api/v1/states'

      expect(response).to be_success

      states      = JSON.parse(response.body)
      state_one   = states[0]
      state_two   = states[1]
      state_three = states[2]

      expect(states.count).to eq(3)

      expect(state_one).to have_key      "id"
      expect(state_one).to have_key      "name"
      expect(state_one).to have_key      "abbreviation"
      expect(state_one).to have_key      "picture_url"
      expect(state_two).to have_key      "id"
      expect(state_two).to have_key      "name"
      expect(state_two).to have_key      "abbreviation"
      expect(state_two).to have_key      "picture_url"
      expect(state_three).to have_key    "id"
      expect(state_three).to have_key    "name"
      expect(state_three).to have_key    "abbreviation"
      expect(state_three).to have_key    "picture_url"

      expect(state_one).to_not have_key    "year"
      expect(state_one).to_not have_key    "altitude"
      expect(state_one).to_not have_key    "observance"
      expect(state_two).to_not have_key    "year"
      expect(state_two).to_not have_key    "altitude"
      expect(state_two).to_not have_key    "observance"
      expect(state_three).to_not have_key  "year"
      expect(state_three).to_not have_key  "altitude"
      expect(state_three).to_not have_key  "observance"

      expect(state_one["id"]).to              eq(1)
      expect(state_one["name"]).to            eq("Ohio")
      expect(state_one["abbreviation"]).to    eq("OH")
      expect(state_one["picture_url"]).to     eq("www.ohio.com")
      expect(state_two["id"]).to              eq(2)
      expect(state_two["name"]).to            eq("Mississippi")
      expect(state_two["abbreviation"]).to    eq("MS")
      expect(state_two["picture_url"]).to     eq("www.mississippi.com")
      expect(state_three["id"]).to            eq(3)
      expect(state_three["name"]).to          eq("Arizona")
      expect(state_three["abbreviation"]).to  eq("AZ")
      expect(state_three["picture_url"]).to   eq("www.arizona.com")

      expect(state_one["id"]).to_not              eq(2)
      expect(state_one["name"]).to_not            eq("Mississippi")
      expect(state_one["abbreviation"]).to_not    eq("AR")
      expect(state_one["picture_url"]).to_not     eq("www.google.com")
      expect(state_two["id"]).to_not              eq(1)
      expect(state_two["name"]).to_not            eq("Ohio")
      expect(state_two["abbreviation"]).to_not    eq("AR")
      expect(state_two["picture_url"]).to_not     eq("www.hamtime.com")
      expect(state_three["id"]).to_not            eq(1)
      expect(state_three["name"]).to_not          eq("Ohio")
      expect(state_three["abbreviation"]).to_not  eq("AR")
      expect(state_three["picture_url"]).to_not   eq("www.jabron.com")
    end
  end
end
