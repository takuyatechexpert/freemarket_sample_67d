class ToppagesController < ApplicationController
  
  def index
    @category = Category.all.order("id ASC").limit(9)
    @item = Item.all.order("id ASC").last(6)
    @image = Image.all.order("id ASC").last(6)
  end

end
