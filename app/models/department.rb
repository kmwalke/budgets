class Department < ApplicationRecord
  validates :name, presence: true

  belongs_to :municipality
  belongs_to :expense

  has_many :line_items
end
