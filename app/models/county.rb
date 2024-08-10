class County < Municipality
  belongs_to :state, class_name: 'State', foreign_key: :municipality_id, inverse_of: :counties
  has_many :cities, class_name: 'City', foreign_key: 'municipality_id'
end
