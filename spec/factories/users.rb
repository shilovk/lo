FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    email
    name { 'UserName' }
    password { '123456' }
    password_confirmation { '123456' }
  end

  trait :admin do
    admin { true }
  end
end
