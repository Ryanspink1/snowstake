class Resort < ApplicationRecord
  has_one    :forecast
  belongs_to :state

  validates :name,
            :snowstake_url,
            :open_snow_id,

            presence: true

  validates :name,
            :snowstake_url,
            :open_snow_id,

            uniqueness: true

  def self.find_by_name(resort_name)
    find_by(name: resort_name)
  end

  def self.retrieve_all_data(resort_name)
    resort = find_by_name(resort_name)
    Rails.cache.fetch("#{resort_name}/resort_show", expires_in: 10.minutes) do
      PostgresConnection.new.raw_sql("SELECT * FROM resorts INNER JOIN forecasts ON resorts.id = forecasts.resort_id WHERE resorts.id = #{resort.id}")[0]
    end
  end
end
