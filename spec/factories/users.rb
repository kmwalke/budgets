FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User_#{n}" }
    sequence(:email) { |n| "user_#{n}@gmail.com" }
    password { 'password' }
  end
end
