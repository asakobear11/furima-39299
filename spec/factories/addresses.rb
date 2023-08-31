FactoryBot.define do
  factory :address do

    postcode       { Faker::Address.postcode }
    prefecture_id  { rand(1..47) }
    city           { Faker::Address.city }
    block          { Faker::Address.street_address }
    phone_number   { Faker::PhoneNumber.phone_number }
    token          {"tok_abcdefghijk00000000000000000"}

  end
end
