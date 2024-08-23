FactoryBot.define do
  factory :county do
    state
    sequence(:name) { |n| "County_#{n}" }
    type { MuniType::COUNTY }
    status { MuniStatus::LIVE }
  end
end
