FactoryBot.define do
  sequence :title do |n|
    "food#{n}"
  end

  factory :food do
    title
    category { rand(1..3) }
    price { rand(5..30) }
    date { Time.current.to_date }
    image { Rack::Test::UploadedFile.new(Rails.root.join('app', 'javascript', 'images', 'rails.jpg')) }
  end

  trait :first do
    category { 1 }
  end

  trait :main do
    category { 2 }
  end

  trait :drink do
    category { 3 }
  end
end
