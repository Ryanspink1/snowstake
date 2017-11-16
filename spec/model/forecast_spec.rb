require 'rails_helper'

RSpec.describe Forecast, type: :model do
  context "validations" do
     it {should validate_presence_of(:current_temp)}
     it {should validate_presence_of(:current_wind_dir)}
     it {should validate_presence_of(:period_one_dow)}
     it {should validate_presence_of(:period_one_date)}
     it {should validate_presence_of(:period_one_day_snow)}
     it {should validate_presence_of(:period_one_day_weather)}
     it {should validate_presence_of(:period_one_day_wind_dir)}
     it {should validate_presence_of(:period_one_day_temp)}
     it {should validate_presence_of(:period_one_night_snow)}
     it {should validate_presence_of(:period_one_night_weather)}
     it {should validate_presence_of(:period_one_night_wind_dir)}
     it {should validate_presence_of(:period_one_night_temp)}
     it {should validate_presence_of(:period_two_dow)}
     it {should validate_presence_of(:period_two_date)}
     it {should validate_presence_of(:period_two_day_snow)}
     it {should validate_presence_of(:period_two_day_weather)}
     it {should validate_presence_of(:period_two_day_wind_dir)}
     it {should validate_presence_of(:period_two_day_temp)}
     it {should validate_presence_of(:period_two_night_snow)}
     it {should validate_presence_of(:period_two_night_weather)}
     it {should validate_presence_of(:period_two_night_wind_dir)}
     it {should validate_presence_of(:period_two_night_temp)}
     it {should validate_presence_of(:period_three_dow)}
     it {should validate_presence_of(:period_three_date)}
     it {should validate_presence_of(:period_three_day_snow)}
     it {should validate_presence_of(:period_three_day_weather)}
     it {should validate_presence_of(:period_three_day_wind_dir)}
     it {should validate_presence_of(:period_three_day_temp)}
     it {should validate_presence_of(:period_three_night_snow)}
     it {should validate_presence_of(:period_three_night_weather)}
     it {should validate_presence_of(:period_three_night_wind_dir)}
     it {should validate_presence_of(:period_three_night_temp)}
     it {should validate_presence_of(:period_four_dow)}
     it {should validate_presence_of(:period_four_date)}
     it {should validate_presence_of(:period_four_day_snow)}
     it {should validate_presence_of(:period_four_day_weather)}
     it {should validate_presence_of(:period_four_day_wind_dir)}
     it {should validate_presence_of(:period_four_day_temp)}
     it {should validate_presence_of(:period_four_night_snow)}
     it {should validate_presence_of(:period_four_night_weather)}
     it {should validate_presence_of(:period_four_night_wind_dir)}
     it {should validate_presence_of(:period_four_night_temp)}
     it {should validate_presence_of(:period_five_dow)}
     it {should validate_presence_of(:period_five_date)}
     it {should validate_presence_of(:period_five_day_snow)}
     it {should validate_presence_of(:period_five_day_weather)}
     it {should validate_presence_of(:period_five_day_wind_dir)}
     it {should validate_presence_of(:period_five_day_temp)}
     it {should validate_presence_of(:period_five_night_snow)}
     it {should validate_presence_of(:period_five_night_weather)}
     it {should validate_presence_of(:period_five_night_wind_dir)}
     it {should validate_presence_of(:period_five_night_temp)}
  end

  context "relationships" do
    it { should belong_to(:resort) }
  end
end
