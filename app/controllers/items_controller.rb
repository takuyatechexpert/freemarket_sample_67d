class ItemsController < ApplicationController
   
  def index
    @items = Item.all
  end

  def new
    
  end

  def show
    @item = Items.find(params[:id])
  end 

end
