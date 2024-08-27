class Municipality < ApplicationRecord
  validates :name, presence: true
  validates :type, presence: true
  validates :status, presence: true

  has_many :departments, dependent: :destroy

  has_one_attached :csv

  def amount
    fetch_line_items.pluck(:amount).sum
  end

  def live?
    status == MuniStatus::LIVE
  end

  private

  def fetch_line_items
    LineItem.where(municipality: { id: }).joins(budget: { department: :municipality })
  end
end
