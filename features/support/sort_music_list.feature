Feature: display list of music sorted by different release_date, name and singer

# Basic Function 2 for a client:
# when browsing music on the homepage,
# I expect to see the music songs sorted by release date, name and singer. So it will be easier for (1) those who love old songs or those who love the latest songs to download their favorite, (2) to locate the song I am looking for

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

  Given the following account exist
  | name          | email              | password        | admin |
  | Admin         | admin@musiclub.com | Admin           | true  |
  | Jack          | jack@gmail.com     | jack123456      | false |

  Given I am on the login page
  When I fill in "user[email]" with "jack@gmail.com"
  And I fill in "password" with "jack123456"
  And I press "Login"
  Then I am on the Musiclub home page
  And 9 seed music should exist

  Given I am on the login page
  When I fill in "user[email]" with "admin@musiclub.com"
  And I fill in "password" with "Admin"
  And I press "Login"
  Then I am on the Musiclub home page
  And 9 seed music should exist

# sort by singer
Scenario: sort music alphabetically on singer
  When I follow "Singer"
  Then I should see "Backroad Therapy" before "Toxic"

# sort by title
Scenario: sort music alphabetically
  When I follow "Music Title"
  Then I should see "Born to Run" before "Toxic"

# sort by release date
Scenario: sort music in increasing order of release date
  When I follow "Release Date"
  Then I should see "So What" before "Toxic" 

