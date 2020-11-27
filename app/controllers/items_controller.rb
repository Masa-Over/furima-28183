class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]


  def edit
  
  end

  def index

  end

  def new

  end

  def show
    
  end

  def create
    
  end

  def destroy
    
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
