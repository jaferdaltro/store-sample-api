FactoryBot.define do
  factory :coupon do
    code { Faker::Commerce.promotion_code(digits: 4) }
    status { :active}
    discount_value { 25.00 }
    max_use { 1 }
    due_date { 3.days.from_now }
  end
end
