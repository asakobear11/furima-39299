class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :details_category
  belongs_to :details_condition
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :delivery_date

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :price,                format: { with: /\A\d+\z/, message: 'は半角数値のみ入力してください' },
                                     numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options presence: true, numericality: { only_integer: true, other_than: 0 } do
    validates :details_category_id,  format: { with: /\A([1-9]|10)\z/ }
    validates :details_condition_id, format: { with: /\A[1-6]\z/ }
    validates :delivery_cost_id,     format: { with: /\A[1-2]\z/ }
    validates :prefecture_id,        format: { with: /\A([1-9]|[1-3][0-9]|4[0-7])\z/ }
    validates :delivery_date_id,     format: { with: /\A[1-3]\z/ }
  end

end
