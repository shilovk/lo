FactoryBot.define do
  factory :order do
    user
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
