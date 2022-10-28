# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

musics = [
  { title: 'Love story Country', category: 'country', release_date: '25-Nov-1992', singer: 'Taylor Swift', description: "Lovely music by Taylor" },
  { title: 'Love story Rock', category: 'rock', release_date: '25-Nov-1992', singer: 'Taylor Swift', description: "Lovely music by Taylor" },
  { title: 'Love story Pop', category: 'pop', release_date: '25-Nov-1992', singer: 'Taylor Swift', description: "Lovely music by Taylor" },
  { title: 'Love story Blues', category: 'blues', release_date: '25-Nov-1992', singer: 'Taylor Swift', description: "Lovely music by Taylor" },
  { title: 'Love story Classical', category: 'classical', release_date: '25-Nov-1992', singer: 'Taylor Swift', description: "Lovely music by Taylor" },
  { title: 'Love story Jazz', category: 'jazz', release_date: '25-Nov-1992', singer: 'Taylor Swift', description: "Lovely music by Taylor" },

]

musics.each do |music|
  Music.create!(music)
end
