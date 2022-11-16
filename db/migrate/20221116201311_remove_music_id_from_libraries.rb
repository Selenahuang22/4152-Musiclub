class RemoveMusicIdFromLibraries < ActiveRecord::Migration
  def change
    remove_column :libraries, :music_id, :string
    remove_column :libraries, :account_id, :string
    add_column :libraries, :music_id, :integer
    add_column :libraries, :account_id, :integer
  end
end
