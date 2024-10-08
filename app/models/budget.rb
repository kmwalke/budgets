class Budget < ApplicationRecord
  validates :year, presence: true

  belongs_to :department

  has_many :line_items

  def amount
    line_items&.map(&:amount)&.sum || 0
  end
end
