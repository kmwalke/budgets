FactoryBot.define do
  factory :city do
    county
    sequence(:name) { |n| "City_#{n}" }
    type { MuniType::CITY }
    status { MuniStatus::LIVE }
  end
end
