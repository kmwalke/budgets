FactoryBot.define do
  factory :city do
    sequence(:name) { |n| "City_#{n}" }
    type { MuniType::CITY }
  end
end
