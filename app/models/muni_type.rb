class MuniType < ApplicationRecord
  TYPES = %w[City County State Fed].freeze

  validates :name, presence: true, uniqueness: true
end
