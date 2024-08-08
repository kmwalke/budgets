FactoryBot.define do
  factory :line_item do
    sequence(:name) { |n| "Line_Item_#{n}" }
    amount { rand(10000...50000) }
    budget
  end
end
