FactoryBot.define do
  factory :order_address do
    transient do
      address { Gimei.address }
    end

    postcode       { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id  { rand(1..47) }
    city           { address.city.kanji }
    block          { address.town.kanji }
    phone_number   { Faker::Number.number(digits: rand(10..11)) }
    user_id        { Faker::Number.positive }
    item_id        { Faker::Number.positive }
    token          {"tok_abcdefghijk00000000000000000"}

  end
end