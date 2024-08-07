class MuniType < ApplicationRecord
  def self.TYPES
    ['City', 'County', 'State', 'Fed']
  end
end
