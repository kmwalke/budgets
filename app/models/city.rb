class City < Municipality
  belongs_to :county, class_name: 'County', foreign_key: :municipality_id, inverse_of: :cities
end
