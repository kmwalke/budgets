class MuniType < ApplicationRecord
  def self.TYPES
    %w[City County State Fed]
  end
end
