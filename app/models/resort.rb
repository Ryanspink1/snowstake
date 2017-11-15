class Resort < ApplicationRecord
  validates :name,
            :snowstake_url,
            :open_snow_id,

            presence: true

  validates :name,
            :snowstake_url,
            :open_snow_id,

            uniqueness: true

end
