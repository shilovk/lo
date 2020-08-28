FactoryBot.define do
  sequence :title do |n|
    "food#{n}"
  end

  factory :food do
    title
  end
end
