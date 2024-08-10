FactoryBot.define do
  factory :city do
    county
    sequence(:name) { |n| "City_#{n}" }
    type { MuniType::CITY }
  end
end
