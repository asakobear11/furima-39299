FactoryBot.define do
  factory :item do
    association :user

    item_name              { Faker::Commerce.product_name }
    description            { Faker::Lorem.sentence    }
    details_category_id    { rand(1..10) }
    details_condition_id   { rand(1..6) }
    delivery_cost_id       { rand(1..2) }
    prefecture_id          { rand(1..47) }
    delivery_date_id       { rand(1..3) }
    price                  { rand(300..9999999) }

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/red_00081.jpg'), filename: 'red_00081.jpg')
      end

  end
end
