class MuniStatus < ApplicationRecord
  STATUSES = %w[Draft Live].freeze

  validates :name, presence: true, uniqueness: true
end
