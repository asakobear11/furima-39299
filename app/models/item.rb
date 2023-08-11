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
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options presence: true, numericality: { only_integer: true, other_than: 0 } do
    validates :details_category_id,  numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
    validates :details_condition_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 6 }
    validates :delivery_cost_id,     numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }
    validates :prefecture_id,        numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 47 }
    validates :delivery_date_id,     numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 }
  end

end
