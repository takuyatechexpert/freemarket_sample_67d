class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string       :coustomer_id,  null: false
      t.string       :card_id,       null: false
      t.string       :references,    null: false
      t.timestamps
    end
  end
end
