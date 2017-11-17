class State < ApplicationRecord
  has_many :resorts

  validates :name,
            :abbreviation,

            presence: true

  validates :name,
            :abbreviation,

            uniqueness: true

  def self.all_states
    all
  end
end
