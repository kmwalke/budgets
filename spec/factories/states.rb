FactoryBot.define do
  factory :state do
    federal { Federal.first }
    sequence(:name) { |n| "State_#{n}" }
    type { MuniType::STATE }
    status { MuniStatus::LIVE }
  end
end
