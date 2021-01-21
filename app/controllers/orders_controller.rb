class OrdersController < ApplicationController
  before_action :set_item, only:[:index]

  def index
    @user_order = UserOrder.new
    @item = Item.find(params[:item_id])  
  end

  def create
    @user_order = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])
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
    if user_signed_in? && current_user.id != @item.user_id
      redirect_to :index
    else
      redirect_to root_path
    end
  end

end



# ログインしていないユーザー
# ログインしているが、出品者である
# ログインしていて、出品者ではない ==> OK

#if user_singned_in? && current_user.id != @item.user_id
  # 購入画面へ
#else
  # トップページへ
#end
