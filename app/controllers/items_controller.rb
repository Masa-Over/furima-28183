class ItemsController < ApplicationController
  before_action  :authenticate_user!, only:[:new]

  def edit
  
  end

  def index
    @items = Item.order("id")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :send_day_id, :image).merge(user_id: current_user.id)
  end
end