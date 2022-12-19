Feature: Musiclub client see music information and is able to download or favorite it from music detail page

# Main function for a client: 
# A client can download or mark musics as favourite in music details page. 

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
  | Jack          | jack@gmail.com     | jack123456      | false |

  Given I am on the login page
  When I fill in "user[email]" with "jack@gmail.com"
  And I fill in "password" with "jack123456"
  And I press "Login"
  Then I am on the Musiclub home page
  And 9 seed music should exist
  And I should see "Jack"

Scenario: go to new music details page and edit music
  Given I am on the Musiclub home page
  When I follow "Shake it Off"
  Then I should see "Details about Shake it Off"
  And I follow "Download"
  Then I am on my download library page
  Then I should see "Shake it Off"

Scenario: favorite a music form Musiclub
  Given I am on the Musiclub home page
  And I should see "Shake it Off"
  When I follow "Shake it Off"
  Then I should see "Details about Shake it Off"
  And I follow "Favorite"
  Then I am on my favorite page
  And I should see "Shake it Off"

Scenario: go back to the home page
  Given I am on the Musiclub home page
  When I follow "Shake it Off"
  Then I should see "Details about Shake it Off"
  And I follow "Back to music list"
  Then I am on the Musiclub home page