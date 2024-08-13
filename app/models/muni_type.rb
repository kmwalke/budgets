class MuniType < ApplicationRecord
  CITY    = 'City'.freeze
  COUNTY  = 'County'.freeze
  STATE   = 'State'.freeze
  FEDERAL = 'Federal'.freeze
  TYPES   = [CITY, COUNTY, STATE, FEDERAL].freeze

  validates :name, presence: true, uniqueness: true
end
