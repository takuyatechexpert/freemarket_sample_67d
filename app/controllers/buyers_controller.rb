class BuyersController < ApplicationController

  def index 
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end
  
  def update
  end

end