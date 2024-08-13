class Department < ApplicationRecord
  validates :name, presence: true

  belongs_to :municipality

  has_many :budgets

  def latest_budget
    budgets.order(year: :desc).first
  end
end
