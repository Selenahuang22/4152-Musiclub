class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :music_id
      t.string :user_id

      t.timestamps null: false
    end
  end
end
