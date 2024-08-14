class Municipality < ApplicationRecord
  validates :name, presence: true
  validates :type, presence: true
  validates :status, presence: true

  has_many :departments

  def amount
    departments&.map(&:amount)&.sum || 0
  end
end
