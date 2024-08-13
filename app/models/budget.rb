class Budget < ApplicationRecord
  validates :year, presence: true

  belongs_to :department

  has_many :line_items

  def total_amount
    line_items.map(&:amount).sum
  end
end
