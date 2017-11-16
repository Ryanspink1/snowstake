
require 'rake'

task :update_forecast => :environment do
  class UpdateForecast
    def self.start
      update_forecasts
    end
  end
end
