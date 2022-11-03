Feature: display list of music sorted by different release_date and name

# Basic Function 2 for a client:
# when browsing music on the homepage,
# I expect to see the music songs sorted by release date and sorted by name. So it will be easier for (1) those who love old songs or those who love the latest songs to download their favorite, (2) to locate the song I am looking for

Background: music have been added to database

  Given the following music exist:
  | title                   | category  | release_date |  singer            |
  | Backroad Therapy        | country   | 28-Oct-2022  |  Alexandra Kay     |
  | Born to Run             | rock      | 25-Aug-1975  |  Bruce Springsteen |
  | Shake it Off            | pop       | 19-Aug-2014  |  Taylor Swift      |
  | Working Man             | blues     | 12-Mar-1974  |  Otis Rush         |
  | Vespers of 1610         | classical | 01-Sep-1610  |  Monteverdi        |
  | So What                 | jazz      | 17-Aug-1959  |  Miles Davis       |
  | You Proof               | country   | 13-May-2022  |  Morgan Wallen     |
  | Toxic                   | pop       | 13-Jan-2004  |  Britney Spears    |
  | Rolling in the Deep     | pop       | 26-Sep-2011  |  Adele             |

  And  I am on the Musiclub home page
  Then 9 seed music should exist

# sort by title
Scenario: sort music alphabetically
  When I follow "Music Title"
  Then I should see "Born to Run" before "Toxic"

# sort by release date
Scenario: sort music in increasing order of release date
  When I follow "Release Date"
  Then I should see "So What" before "Toxic"  


# TODO in iter 2:

# Scenario: Add "writing comment" function for clients and the songs can be sorted by the number of comments 

# Scenario: Record the playing times for music and enable the songs to be sorted by playing times
