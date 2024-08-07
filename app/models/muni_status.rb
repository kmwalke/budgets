class MuniStatus < ApplicationRecord
  def self.STATUSES
    %w[Draft Live]
  end
end
