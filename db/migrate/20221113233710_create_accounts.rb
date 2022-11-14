class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end

  def down
    drop_table :accounts
  end
end
