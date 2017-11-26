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
end
