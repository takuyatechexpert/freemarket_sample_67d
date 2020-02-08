class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string   :name,               null: false
      t.integer  :price,              null: false
      t.text     :description,        null: false
      t.string   :size,               null: false
      t.integer  :item_status,        null: false
      t.integer  :delivery_charge,    null: false
      t.string   :delivery_area,      null: false
      t.integer  :shipment,           null: false
      # t.references :brand, null: false, foreign_key: true
      t.integer :buyer_id
      t.integer :seller_id
      t.timestamps
    end
  end
end
