FactoryBot.define do
  factory :municipality do
    sequence(:name) { |n| "Muni_#{n}" }
    expense
    status { MuniStatus::LIVE }
    type { MuniType::STATE }
  end
end
