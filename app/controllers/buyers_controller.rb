class BuyersController < ApplicationController

  def index 
    @category = Category.all.order("id ASC").limit(9)
  end

  def show 
    @category = Category.all.order("id ASC").limit(9)
  end

  def edit
  end
  
  def update
  end

end