FactoryBot.define do
  sequence :title do |n|
    "food#{n}"
  end

  factory :food do
    title
    price { rand(5..10) }
    date { Time.current.to_date }
  end
end
