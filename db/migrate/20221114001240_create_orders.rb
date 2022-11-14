class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :music_title
      t.string :user_email
      t.integer :status
      t.string :price

      t.timestamps
    end
  end

  def down
    drop_table :orders
  end
end
