class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]


  def edit
  
  end

  def index
    @items = Item.all
  end

  def new
    @items = Items.new
  end

  def show
    
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end