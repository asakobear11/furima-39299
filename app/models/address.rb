class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postcode,      format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 47 }
    validates :city
    validates :block
    validates :phone_number,  format: { with: /\A\d{10,11}\z/ }
  end
end
