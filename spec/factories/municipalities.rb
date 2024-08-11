FactoryBot.define do
  factory :municipality do
    sequence(:name) { |n| "Muni_#{n}" }
    type { MuniType::STATE }
  end
end
