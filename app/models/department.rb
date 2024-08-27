class Department < ApplicationRecord
  validates :name, presence: true

  belongs_to :municipality

  has_many :budgets

  def latest_budget
    budgets&.order(year: :desc)&.first
  end

  def amount
    fetch_line_items.pluck(:amount).sum
  end

  private

  def fetch_line_items
    LineItem.where(department: { id: }).joins(budget: :department)
  end
end
