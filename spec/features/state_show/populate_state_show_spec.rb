require 'rails_helper'

describe "state show path", :type => :feature, :js => true do
  attr_reader :boston_mills, :ham_hills, :miss_mills, :boston_mills_forecast, :ham_hills_forecast, :miss_mills_forecast, :state

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
  end

  it "populates modal buttons" do
    visit "/states/Ohio"

    expect(page).to have_css(".state-directory-item", :count => 5)

    within page.all(".state-directory-item")[0] do
      expect(page).to have_content("Radar")
      expect(page).to_not have_content("Snow Stakes")
    end
    within page.all(".state-directory-item")[1] do
      expect(page).to have_content("Snow Stakes")
      expect(page).to_not have_content("Hamilton")
    end
    within page.all(".state-directory-item")[2] do
      expect(page).to have_content("Snowfall")
      expect(page).to_not have_content("Snow Stakes")
    end
    within page.all(".state-directory-item")[3] do
      expect(page).to have_content("DOT Twitter")
      expect(page).to_not have_content("Snow Stakes")
    end
    within page.all(".state-directory-item")[4] do
      expect(page).to have_content("Resorts")
      expect(page).to_not have_content("Snow Stakes")
    end
  end

  it "populates modals" do
    visit "/states/ohio"

    within page.all(".state-directory-item")[0] do
      page.find(".state-directory-item-header").click
      expect(page).to have_css("#radar-cover-image")
      expect(page).to_not have_css("#all-snow-stakes-cover-image")
    end

    within page.all(".state-directory-item")[1] do
      page.find(".state-directory-item-header").click
      expect(page).to have_css("#all-snow-stakes-cover-image")
      expect(page).to_not have_css("#radar-cover-image")
    end

    within page.all(".state-directory-item")[2] do
      page.find(".state-directory-item-header").click
      expect(page).to have_css("#forecast-modal-sticky-name")
      expect(page).to_not have_css("#all-snow-stakes-cover-image")
    end

    within page.all(".state-directory-item")[3] do
      page.find(".state-directory-item-header").click
      expect(page).to have_css("#transportation-twitter-container")
      expect(page).to_not have_css("#all-snow-stakes-cover-image")
    end

    within page.all(".state-directory-item")[4] do
      page.find(".state-directory-item-header").click
      expect(page).to have_css(".resorts-instance")
      expect(page).to_not have_css("#all-snow-stakes-cover-image")
    end
  end
end
