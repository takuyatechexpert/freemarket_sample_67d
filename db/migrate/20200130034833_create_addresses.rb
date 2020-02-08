class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table   :addresses do |t|
      t.integer    :postal_code,              null: false
      t.string     :municipalities,           null: false
      t.string     :address,                  null: false
      t.string     :home_type
      t.integer    :tel,                      null: false
      t.references :user,                     null: false, foreign_key: true
      t.timestamps
    end
  end
end
