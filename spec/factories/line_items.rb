FactoryBot.define do
  factory :line_item do
    sequence(:name) { |n| "Line_Item_#{n}" }
    department
    expense
  end
end
