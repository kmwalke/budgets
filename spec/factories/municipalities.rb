FactoryBot.define do
  factory :municipality do
    sequence(:name) { |n| "Muni_#{n}" }
    expense
    muni_status
    muni_type
  end
end
