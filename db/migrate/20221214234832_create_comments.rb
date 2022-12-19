class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :music_id
      t.integer :account_id
      t.string :content

      t.timestamps null: false
    end
  end
end
