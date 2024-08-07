class Municipality < ApplicationRecord
  validates :name, presence: true
  validates :muni_type, presence: true
  validates :muni_status, presence: true
  
  belongs_to :muni_type, foreign_key: 'muni_type'
  belongs_to :muni_status, foreign_key: 'muni_status'
  belongs_to :expense
end
