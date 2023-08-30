class AddressesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    # @item = Item.find_by(id: params[:format])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id)
  end

  
end
