class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :music_id
      t.string :account_id

      t.timestamps null: false
    end
  end
end
