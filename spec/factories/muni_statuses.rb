FactoryBot.define do
  factory :muni_status do
    sequence(:name) { |n| "MuniStatus_#{n}" }
  end
end
