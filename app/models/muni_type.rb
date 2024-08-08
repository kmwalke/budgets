class MuniType < ApplicationRecord
  CITY   = 'City'.freeze
  COUNTY = 'County'.freeze
  STATE  = 'State'.freeze
  FED    = 'Federal'.freeze
  TYPES  = [CITY, COUNTY, STATE, FED].freeze

  validates :name, presence: true, uniqueness: true
end
