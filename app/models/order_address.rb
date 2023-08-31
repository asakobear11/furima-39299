class OrderAddress

  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number,:user_id, :item_id, :token

  with_options presence: true do
    validates :postcode,      format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 47 }
    validates :city
    validates :block
    validates :phone_number,  format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end