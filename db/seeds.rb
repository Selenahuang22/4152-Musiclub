# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

musics = [

  { title: 'Backroad Therapy', category: 'country', release_date: '28-Oct-2022', singer: 'Alexandra Kay', description: "Backroad Therapy by Alexandra Kay" },
  { title: 'Born to Run', category: 'rock', release_date: '25-Aug-1975', singer: 'Bruce Springsteen', description: "Born to Run by Bruce Springsteen" },
  { title: 'Shake it Off', category: 'pop', release_date: '19-Aug-2014', singer: 'Taylor Swift', description: "Shake it Off by Taylor" },
  { title: 'Working Man', category: 'blues', release_date: '12-Mar-1974', singer: 'Otis Rush', description: "Working Man by Otis Rush" },
  { title: 'Vespers of 1610', category: 'classical', release_date: '01-Sep-1610', singer: 'Monteverdi', description: "Vespers of 1610 by Monteverdi" },
  { title: 'So What', category: 'jazz', release_date: '17-Aug-1959', singer: 'Miles Davis', description: "So What by Miles Davis" },
  { title: 'You Proof', category: 'country', release_date: '13-May-2022', singer: 'Morgan Wallen', description: "You Proof by Morgan Wallen" },
  { title: 'Toxic', category: 'pop', release_date: '13-Jan-2004', singer: 'Miles Davis', description: "Toxic by Miles Davis" },
  { title: 'Rolling in the Deep', category: 'pop', release_date: '26-Sep-2011', singer: 'Adele', description: "Rolling in the Deep by Adele" },


]

musics.each do |music|
  Music.create!(music)
end
