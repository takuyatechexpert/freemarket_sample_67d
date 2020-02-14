class ToppagesController < ApplicationController
  
  def index
    @category = Category.all.order("id ASC").limit(13)
    @item = Item.all.order("id ASC").last(6)
    @image = Image.all.order("id ASC").last(6)
  end

end
