FactoryBot.define do
  factory :muni_type do
    sequence(:name) { |n| "MuniType_#{n}" }
  end
end
