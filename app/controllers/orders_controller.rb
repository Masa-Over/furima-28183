class OrdersController < ApplicationController

  def index
    
  end

  def create
    @user_order = UserOrder.new(order_params)
     if @user_order.valid?
       @user_order.save
       redirect_to action: :index
     else
       render action: :new
     end
  end

  private
  def order_params
    params.reqiure(:user_order).permit(:prefecture_id, :municipalities, :address, :postal_code, :phone_number, :building, :user, :item)
  end
end
