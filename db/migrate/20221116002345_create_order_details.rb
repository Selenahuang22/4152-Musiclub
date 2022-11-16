class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.string :music_id
      t.string :account_id
      t.integer :status
      t.string :price

      t.timestamps null: false
    end
  end
end
