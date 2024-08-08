FactoryBot.define do
  factory :municipality do
    sequence(:name) { |n| "Muni_#{n}" }
    status { MuniStatus::DRAFT }
    type { MuniType::STATE }
  end
end
