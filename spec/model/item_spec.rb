require 'rails_helper'
describe Item do
  describe '#create' do
    it "is invalid without a name" do
      item = Item.new()
    end
  end
end