Feature: display list of musics filtered user's search result

# Function for a client and an admin:
# when browsing music on the homepage,
# I expect to search the music by music title

Background: music have been added to database

  Given the following music exist
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

# search by exact music name
Scenario: search by exact music title
  When I fill in "search" with "toxic"
  And I press "search button"
  Then I should see the following music: Toxic
  Then I should not see the following music: Backroad Therapy, Born to Run, Shake it Off, Working Man, Vespers of 1610, So What, You Proof, Rolling in the Deep

# search by vague name
Scenario: search by exact music title
  When I fill in "search" with "of"
  And I press "search button"
  Then I should see the following music: Shake it Off, Vespers of 1610, You Proof
  Then I should not see the following music: Backroad Therapy, Born to Run, Working Man, So What, Rolling in the Deep, Toxic

# no input given in search, should give all the music
Scenario: no input in search
  When I fill in "search" with ""
  And I press "search button"
  Then I should see all the music

# no the search input is an empty string, should give all the music
Scenario: empty string in search
  When I fill in "search" with "     " 
  And I press "search button"
  Then I should see all the music

# no searching result, should give empty music list
Scenario: no searching result
  When I fill in "search" with "xxxxxxx"
  And I press "search button"
  Then I should not see the following music: Backroad Therapy, Born to Run, Shake it Off, Working Man, Vespers of 1610, So What, You Proof, Rolling in the Deep, Toxic

