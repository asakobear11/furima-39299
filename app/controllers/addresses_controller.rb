class AddressesController < ApplicationController
  def index
    @item = Item.find_by(id: params[:format])
  end

  def create
  end

  
end
