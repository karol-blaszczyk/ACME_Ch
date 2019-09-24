FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '11111111' }
    password_confirmation { '11111111' }
  end
end

FactoryBot.define do
  factory :plan do
    name { Faker::Commerce.product_name }
    price { 1000 }
  end
end

FactoryBot.define do
  factory :subscription do
    user
    plan
    price { 1000 }
  end
end
