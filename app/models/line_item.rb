class LineItem < ApplicationRecord
  validates :name, presence: true

  belongs_to :budget
end
