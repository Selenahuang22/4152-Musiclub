Feature: display list of music sorted by different criteria

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

Scenario: sort music alphabetically
  When I follow "Music Title"
  Then I should see "Born to Run" before "Toxic"

Scenario: sort music in increasing order of release date
  When I follow "Release Date"
  Then I should see "So What" before "Toxic"  
