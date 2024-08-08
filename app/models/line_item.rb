class LineItem < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  belongs_to :budget
end
