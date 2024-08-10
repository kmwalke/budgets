FactoryBot.define do
  factory :county do
    sequence(:name) { |n| "County_#{n}" }
    type { MuniType::COUNTY }
  end
end
