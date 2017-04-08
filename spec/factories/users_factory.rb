FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "factory#{n}@girl.user" }
    password 'password'
    password_confirmation 'password'
  end
end
