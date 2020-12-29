class OrdersController < ApplicationController

  def index
    # @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
     if @order.valid?
       @order.save
       redirect_to 
     else
       render root_path
     end
  end

  private
  def order_params
    params.reqiure(:order).permit(:prefecture_id, :municipalities, :address, :postal_code, :phone_number, :building, :user, :item).merge(user_id: current_user_id, item_id: params[:tweet_id])
  end
end
