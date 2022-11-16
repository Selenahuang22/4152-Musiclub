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
  { title: 'Youth', category: 'pop', release_date: '13-Nov-2015', singer: 'Troye Sivan', description: "A famous pop music by Troye Sivan" },
  { title: 'Blue', category: 'pop', release_date: '04-Dec-2015', singer: 'Troye Sivan', description: "Music by an Australian singer-Troye Sivan" },
  { title: 'Hotel California', category: 'country', release_date: '04-Feb-1977', singer: 'Don Henley', description: "Country Music by Don Henley" },
  { title: 'Alone', category: 'country', release_date: '02-Dec-2016', singer: 'Alan Walker', description: "A country music:Alone by Alan Walker" },
  { title: 'Sunday Morning', category: 'country', release_date: '01-Jan-2002', singer: 'Maroon 5', description: "Sunday Morning by Maroon 5" },
  { title: 'Take It Easy', category: 'country', release_date: '01-May-1972', singer: 'Eagles', description: "Take It Easy by Eagles" },
  { title: 'Love Story', category: 'country', release_date: '12-Sep-2008', singer: 'Taylor Swift', description: "Love Story by Taylor Swift" },
  { title: 'Eine kleine Nachtmusik', category: 'classical', release_date: '12-Mar-1787', singer: 'Mozart', description: "Famous classical music by Mozart" },
  { title: 'Für Elise', category: 'classical', release_date: '21-Mar-1788', singer: 'Beethoven', description: "Famous classical music by Beethoven" },
  { title: 'Toccata and Fugue in D minor', category: 'classical', release_date: '21-Feb-1931', singer: 'J.S. Bach', description: "Famous classical music by J.S. Bach" },
  { title: 'Symphony No.5 in C minor', category: 'classical', release_date: '03-Aug-1821', singer: 'Beethoven', description: "Famous classical music by Beethoven" },
  { title: 'The Four Seasons', category: 'classical', release_date: '21-Aug-1900', singer: 'Vivaldi', description: "Famous classical music by Vivaldi" },
  { title: 'Carmen', category: 'classical', release_date: '21-Oct-1875', singer: 'Bizet', description: "Famous classical music by Bizet" },
  { title: 'Fly Me to the Moon', category: 'jazz', release_date: '13-Apr-1954', singer: 'Frank Sinatra', description: "Famous jazz music by Frank Sinatra" },
  { title: 'My Funny Valentine', category: 'jazz', release_date: '19-Oct-1937', singer: 'Miles Davis', description: "Famous jazz music by Miles Davis" },
  { title: 'Summertime', category: 'jazz', release_date: '24-Sep-1934', singer: 'Ella Fitzgerald', description: "Famous jazz music by Ella Fitzgerald" },
  { title: 'What a Wonderful World', category: 'jazz', release_date: '01-Sep-1967', singer: 'Louis Armstrong', description: "Famous jazz music by Louis Armstrong" },
  { title: 'Here\'s To Never Growing Up', category: 'rock', release_date: '04-Apr-2013', singer: 'Avril Lavigne', description: "Famous rock music by Avril Lavigne" },
  { title: 'Already Gone', category: 'rock', release_date: '02-Apr-1974', singer: 'Eagles', description: "Famous rock music by Eagles" },
  { title: 'Complicated', category: 'rock', release_date: '14-May-2002', singer: 'Avril Lavigne', description: "Famous rock music by Avril Lavigne" },
  { title: 'Tom Rushen Blues', category: 'blues', release_date: '20-May-1997', singer: 'Charley Patton', description: "Famous blues music by Charley Patton" },
  { title: 'Black Night', category: 'blues', release_date: '20-Oct-1991', singer: 'Charles Brown', description: "Famous blues music by Charles Brown" },
  { title: 'Still a Fool', category: 'blues', release_date: '20-May-1999', singer: 'Muddy Waters', description: "Famous blues music by Muddy Waters" },
  { title: 'Girlfriend', category: 'rock', release_date: '14-Feb-2005', singer: 'Avril Lavigne', description: "Famous rock music by Avril Lavigne" },
  { title: '22', category: 'country', release_date: '13-Mar-2013', singer: 'Taylor Swift', description: "22 by Taylor Swift" },
  { title: 'I Knew You Were Trouble', category: 'pop', release_date: '09-Oct-2012', singer: 'Taylor Swift', description: "I Knew You Were Trouble by Taylor Swift" },
  { title: 'We Are Never Ever Getting Back Together', category: 'pop', release_date: '13-Aug-2012', singer: 'Taylor Swift', description: "We Are Never Ever Getting Back Together by Taylor Swift" },
  { title: 'Faded', category: 'pop', release_date: '04-Dec-2015', singer: 'Alan Walker', description: "Faded by Alan Walker" },
  { title: 'Symphony No.41 in C, K551 - Jupiter', category: 'classical', release_date: '02-Jan-1787', singer: 'Mozart', description: "Famous classical music by Mozart" },
  { title: 'Requiem Mass in D minor, K626', category: 'classical', release_date: '02-Jan-1788', singer: 'Mozart', description: "Famous classical music by Mozart" },
  { title: 'Quintet in A for Clarinet and Strings, K581', category: 'classical', release_date: '02-Mar-1789', singer: 'Mozart', description: "Famous classical music by Mozart" },
]

musics.each do |music|
  Music.create!(music)
end


accounts = [
  {name: 'Admin', email: 'admin@musiclub.com', password: 'Admin', admin: true},

  {name: 'James', email: 'james@gmail.com', password: 'James12345678', admin: false},
  {name: 'Alice', email: 'Alice@gmail.com', password: 'Alice12345678', admin: false},
  {name: 'Kris', email: 'Kris@gmail.com', password: 'Kris12345678', admin: false},
  {name: 'Slena', email: 'Slena@gmail.com', password: 'Slena12345678', admin: false},
  {name: 'John', email: 'John@gmail.com', password: 'John12345678', admin: false},
  {name: 'Len', email: 'Len@gmail.com', password: 'Len12345678', admin: false},
  {name: 'Tony', email: 'Tony@gmail.com', password: 'Tony12345678', admin: false},
  {name: 'Bob', email: 'Bob@gmail.com', password: 'Bob12345678', admin: false},
  {name: 'Avil', email: 'Avil@gmail.com', password: 'Avil12345678', admin: false},
  {name: 'Chen', email: 'Chen@gmail.com', password: 'Chen12345678', admin: false},
  {name: 'Winnie', email: 'Winnie@gmail.com', password: 'Winnie12345678', admin: false},
  {name: 'Yuan', email: 'Yuan@gmail.com', password: 'Yuan12345678', admin: false},
  {name: 'Angel', email: 'Angel@gmail.com', password: 'Angel12345678', admin: false},
  {name: 'Kit', email: 'Kit@gmail.com', password: 'Kit12345678', admin: false},
  {name: 'Tian', email: 'Tian@gmail.com', password: 'Tian12345678', admin: false},
  {name: 'Tom', email: 'Tom@gmail.com', password: 'Tom12345678', admin: false},
  {name: 'Jerry', email: 'Jerry@gmail.com', password: 'Jerry12345678', admin: false},
]

accounts.each do |account|
  Account.create!(account)
end