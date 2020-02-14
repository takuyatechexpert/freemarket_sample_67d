class ToppagesController < ApplicationController
  include CommonActions
  before_action :get_categories, only:[:index]
  
  def index
    # @category = Category.all.order("id ASC").limit(13)
    @item = Item.all.order("id DESC").last(6)
    @image = Image.all.order("id DESC").last(6)
  end

end
