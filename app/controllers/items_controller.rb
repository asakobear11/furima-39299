class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new 
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :description, :details_category_id, :details_condition_id, :delivery_cost_id, :prefecture_id, :delivery_date_id, :price)
  end

end
