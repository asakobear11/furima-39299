class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :details_category
  belongs_to :details_condition
  belongs_to :delivery_cost
  belongs_to :prefecture
  belongs_to :delivery_date

  has_one_attached :image


  validates :image, :item_name, :description, :details_category_id, :details_condition_id, :delivery_cost_id, :prefecture_id, :delivery_date_id, :price, presence: true

  validates :details_category_id, :details_condition_id, :delivery_cost_id, :prefecture_id, :delivery_date_id, numericality: { other_than: 0 , message: "can't be blank"} 

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price, format: { with: /\A\d+\z/, message: "は半角数値のみ入力してください" }


end
