class MuniStatus < ApplicationRecord
  DRAFT = 'draft'.freeze
  LIVE = 'live'.freeze
  STATUSES = [DRAFT LIVE].freeze

  validates :name, presence: true, uniqueness: true
end
