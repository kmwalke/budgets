class Expense < ApplicationRecord
  validates :year, presence: true
  validates :amount, presence: true
end
