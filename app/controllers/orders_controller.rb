class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
  end

  private

  def order_params
    params.permit.merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def address_params
    params.permit(:postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number).merge(order_id: @order.id)
  end
end
