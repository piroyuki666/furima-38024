FactoryBot.define do
  factory :order_address do
    city { Faker::Address.city }
    addresses { Faker::Address.street_name }
    postal_code { Faker::Number.number(digits: 7).to_s.insert(3, '-') }
    item_prefecture_id { Faker::Number.between(from: 2, to: 48) }
    building { Faker::Address.secondary_address }
    phone_number { Faker::Number.number(digits: 10) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
