FactoryBot.define do
  factory :department do
    sequence(:name) { |n| "Department_#{n}" }
    municipality
  end
end
