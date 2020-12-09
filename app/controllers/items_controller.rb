class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]


  def edit
  
  end

  def index
    
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

  def destroy
    
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
