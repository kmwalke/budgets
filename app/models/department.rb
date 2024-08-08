class Department < ApplicationRecord
  validates :name, presence: true

  belongs_to :municipality

  has_many :budgets
end
