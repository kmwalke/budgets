class Department < ApplicationRecord
  validates :name, presence: true

  belongs_to :municipality

  has_many :budgets, dependent: :destroy

  def latest_budget
    budgets&.order(year: :desc)&.first
  end

  def amount
    latest_budget&.amount || 0
  end
end
