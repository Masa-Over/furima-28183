class OrdersController < ApplicationController

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:user_order).permit(:prefecture_id, :municipalities, :address, :postal_code, :phone_number, :building )
  end

end
