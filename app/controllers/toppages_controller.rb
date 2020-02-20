class ToppagesController < ApplicationController
  include CommonActions
  before_action :get_categories, only:[:index]
  
  def index
    # @category = Category.all.order("id ASC").limit(13)
    @item = Item.all.order("id DESC").first(6)
    # .where.not(current_user.id == seller.id)
    @image = Image.all.order("id DESC")
  end

end
