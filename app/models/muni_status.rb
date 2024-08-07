class MuniStatus < ApplicationRecord
  def self.STATUSES
    ['Draft', 'Live']
  end
end
