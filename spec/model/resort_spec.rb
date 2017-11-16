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
end
