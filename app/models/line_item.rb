class LineItem < ApplicationRecord
  validates :name, presence: true

  belongs_to :expense
  belongs_to :department
end
