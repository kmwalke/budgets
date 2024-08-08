class Municipality < ApplicationRecord
  validates :name, presence: true
  validates :type, presence: true
  validates :status, presence: true
end
