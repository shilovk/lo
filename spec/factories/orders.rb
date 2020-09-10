FactoryBot.define do
  factory :order do
    user
    date { Time.current.to_date }
    total_price { rand(5..30) }
  end

  trait :forming do
    status { Order::STATUSES[0] }
  end

  trait :processing do
    status { Order::STATUSES[1] }
  end

  trait :performed do
    status { Order::STATUSES[2] }
  end
end
