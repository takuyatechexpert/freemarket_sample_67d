class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price, null: false
      t.string :size, null:false
      t.integer :status_id, null:false
      t.integer :postage_id, null: false
      t.integer :region_id, null:false
      t.integer :shipping_date_id, null: false
      #t.references :user, null: false, foreign_key: true
      #t.references :brand, null: false, foreign_key: true
      #t.references :category, null:false, foreign_key: true
      t.integer :buyer_id
      t.integer :seller_id
      t.timestamps
    end
  end
end