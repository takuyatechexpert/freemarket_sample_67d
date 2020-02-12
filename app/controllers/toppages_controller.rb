class ToppagesController < ApplicationController
  
  def index
    @category = Category.all.order("id ASC").limit(9)
    
  end

end
