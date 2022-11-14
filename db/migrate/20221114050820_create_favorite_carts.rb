class CreateFavoriteCarts < ActiveRecord::Migration
  def change
    create_table :favorite_carts do |t|
      t.string :music_id
      t.string :account_id

      t.timestamps null: false
    end
  end
end
