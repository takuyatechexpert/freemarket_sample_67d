class BuyersController < ApplicationController

  def index 
    @category = Category.all.order("id ASC").limit(9)
  end

  def show
    @item = Item.find(params[:id])
    @category = Category.all.order("id ASC").limit(9)
  end

  def edit
  end
  
  def update
  end

end