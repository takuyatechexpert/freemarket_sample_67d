class CardsController < ApplicationController
  def index
  end
  
  def pay
      Payjp.api_key = '秘密キー'
      charge = Payjp::Charge.create(
      :amount => 3500,
      :card => params['payjp-token'],
      :currency => 'jpy',
  )
  end
end
