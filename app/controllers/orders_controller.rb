class OrdersController < ApplicationController

  def index
    @user_order = UserOrder.new
  end


end
