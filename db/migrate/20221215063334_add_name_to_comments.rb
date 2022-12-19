class AddNameToComments < ActiveRecord::Migration
  def change
    add_column :comments, :music_title, :string
    add_column :comments, :account_name, :string
  end
end
