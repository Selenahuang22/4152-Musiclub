class RemoveMusicIdFromLibraries < ActiveRecord::Migration
  def change
    remove_column :libraries, :music_id, :string
    remove_column :libraries, :account_id, :string
    add_column :libraries, :music_id, :integer
    add_column :libraries, :account_id, :integer

    remove_column :favorite_carts, :music_id, :string
    remove_column :favorite_carts, :account_id, :string
    add_column :favorite_carts, :music_id, :integer
    add_column :favorite_carts, :account_id, :integer

    
    remove_column :order_details, :music_id, :string
    remove_column :order_details, :account_id, :string
    add_column :order_details, :music_id, :integer
    add_column :order_details, :account_id, :integer
  end
end
