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

end
