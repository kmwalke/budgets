class Federal < Municipality
  has_many :states, class_name: 'State', foreign_key: 'municipality_id', inverse_of: :federal
end
