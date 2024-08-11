FactoryBot.define do
  factory :state do
    federal
    sequence(:name) { |n| "State_#{n}" }
    type { MuniType::STATE }
  end
end
