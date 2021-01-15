class OrdersController < ApplicationController

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end


  end

  private
  def order_params
    params.permit(:prefecture_id, :municipalities, :address, :postal_code, :phone_number, :building, :item_id,  ).merge(user_id: current_user.id)
  end

end
