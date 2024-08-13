class Budget < ApplicationRecord
  validates :year, presence: true

  belongs_to :department

  has_many :line_items

  def total_amount
    line_items.map do |line_item|
      line_item.amount
    end.sum
  end
end
