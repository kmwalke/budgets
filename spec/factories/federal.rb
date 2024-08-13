FactoryBot.define do
  factory :federal do
    name { 'Federal' }
    type { MuniType::FEDERAL }
  end
end
