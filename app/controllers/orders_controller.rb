class OrdersController < ApplicationController
  before_action  :authenticate_user!, only:[:index]
  before_action :set_item, only:[:index,:create]

  def index
    if user_signed_in? && current_user.id != @item.user_id && @item.purchase_record == nil 
      @user_order = UserOrder.new
    else
      redirect_to root_path
    end
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end


  end

  private
  def order_params
    params.permit(:prefecture_id, :municipalities, :address, :postal_code, :phone_number, :building, :item_id,  ).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
