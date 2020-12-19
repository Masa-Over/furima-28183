class ItemsController < ApplicationController
  before_action  :authenticate_user!, only:[:new, :edit]
  before_action  :set_item, only: [:edit, :show, :update, :destroy]

  def edit
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to (@item)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destory
    else
      redirect_to root_path
    end
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

  def set_item
    @item = Item.find(params[:id])
  end
end