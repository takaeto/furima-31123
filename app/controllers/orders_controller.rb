class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:set_cocoa]
  before_action :set_order, only: [:index, :create, :set_cocoa, :pay_item]
  before_action :set_cocoa

  def index
    @order = OrderDonation.new
  end

  def create
    @order = OrderDonation.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_cocoa
    if current_user.id == @item.user_id && @item.purchase != nil
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_donation).permit(:post_code, :city, :address, :building_name, :phone_number, :prefecture_id).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end