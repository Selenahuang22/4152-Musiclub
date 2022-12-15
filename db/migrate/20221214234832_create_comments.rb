class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :music_id
      t.string :account_id
      t.string :content

      t.timestamps null: false
    end
  end
end
