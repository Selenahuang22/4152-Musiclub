class CreateMusics < ActiveRecord::Migration
  def up
    create_table :musics do |t|
      t.string :title
      t.string :category
      t.string :singer
      t.text :description
      t.datetime :release_date
  
      t.timestamps
    end
  end
  
  def down
    drop_table :musics
  end
end


