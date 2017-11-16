class State < ApplicationRecord
  has_many :resorts

  validates :name,
            :abbreviation,
            
            presence: true

  validates :name,
            :abbreviation,

            uniqueness: true

end
