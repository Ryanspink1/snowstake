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
end
