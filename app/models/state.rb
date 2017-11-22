class State < ApplicationRecord
  has_many :resorts

  validates :name,
            :abbreviation,
            :picture_url,

            presence: true

  validates :name,
            :abbreviation,
            :picture_url,

            uniqueness: true

  def self.all_states
    all
  end

  def self.find_state_by_name(state_name)
    find_by(name:state_name)
  end

  def self.find_resorts(state_name)
    state_name[0] = state_name[0].upcase
    state = find_state_by_name(state_name)
    resorts_and_forecasts = PostgresConnection.new.raw_sql("SELECT * FROM resorts INNER JOIN forecasts ON resorts.id = forecasts.resort_id WHERE resorts.state_id = #{state.id}")
    {state.name =>{:twitter => state.twitter_url, :radar => state.radar_url, :resorts => resorts_and_forecasts}}
  end
end
