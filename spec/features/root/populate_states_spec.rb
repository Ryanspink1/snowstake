require 'rails_helper'

describe "Root Path", :type => :feature, :js => true do
  it "populates states" do
    Fabricate(:state, id:1, name:"Ohio", abbreviation:"OH", picture_url:"https://s3-us-west-2.amazonaws.com/snowstake/states/colorado-black-state-shape-md.png")
    Fabricate(:state, id:2, name:"Mississippi", abbreviation:"MS", picture_url: "https://s3-us-west-2.amazonaws.com/snowstake/states/black-cali-md.png")

    visit "/"

    expect(page).to     have_css(".state-index-item", count: 2)

    expect(page).to_not have_css(".state-index-item", count: 3)
    expect(page).to_not have_css(".root-index-item", count: 2)


    within first(".state-index-item") do
      expect(page).to     have_css(".state-index-item-header")
      expect(page).to     have_css(".image-text")
      expect(page).to     have_css(".state-index-item-picture")
      expect(page).to_not have_css(".resort-index-item-header")
      expect(page).to_not have_css(".resort-image-text")
      expect(page).to_not have_css(".resort-index-item-picture")

      expect(page).to     have_content("Ohio")
      expect(page).to_not have_content("Mississippi")
    end

    within page.all(".state-index-item")[1] do
      expect(page).to     have_css(".state-index-item-header")
      expect(page).to     have_css(".image-text")
      expect(page).to     have_css(".state-index-item-picture")
      expect(page).to_not have_css(".resort-index-item-header")
      expect(page).to_not have_css(".resort-image-text")
      expect(page).to_not have_css(".resort-index-item-picture")

      expect(page).to     have_content("Mississippi")
      expect(page).to_not have_content("Ohio")
    end
  end
end
