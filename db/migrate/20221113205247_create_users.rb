class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :user_name
      t.string :email
      t.string :password
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
