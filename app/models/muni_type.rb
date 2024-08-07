class MuniType < ApplicationRecord
  CITY   = 'City'.freeze
  COUNTY = 'County'.freeze
  STATE  = 'State'.freeze
  FED    = 'Federal'.freeze
  TYPES  = [City County State Fed].freeze

  validates :name, presence: true, uniqueness: true
end
