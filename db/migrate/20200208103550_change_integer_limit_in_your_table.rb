class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :tel, :integer, limit: 8
  end 
end
