class State < Municipality
  belongs_to :federal, class_name: 'Federal', foreign_key: :municipality_id, inverse_of: :states
  has_many :counties, class_name: 'County', foreign_key: 'municipality_id'

  def cities
    City.joins(:county).where(county: { state: self })
  end
end
