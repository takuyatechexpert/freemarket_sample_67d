class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table   :addresses do |t|
      t.integer   :destination_first_name,    null: false
      t.integer    :destination_family_name,  null: false
      t.integer    :postal_code,              null: false
      t.string     :prefectures,              null: false
      t.string     :municipalities,           null: false
      t.string     :address,                  null: false
      t.string     :home_type,                null: false
      t.integer    :tel,                      null: false
      t.references :user,                     null: false, foreign_key: true
      t.timestamps
    end
  end
end
