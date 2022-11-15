Feature: Musiclub manager and client see music information

# Basic function 2: 
# A manager and a client can see music information of a specific music.

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

Scenario: see details of a specific music
  Given I am on the Musiclub home page
  When I follow "Shake it Off"
  Then I should see "Details about Shake it Off"
  And I should see "Taylor Swift"
  When I follow "Home"
  Then I am on the Musiclub home page
  When I follow "Rolling in the Deep"
  Then I should see "Details about Rolling in the Deep"
  And I should see "Adele"
  When I follow "Home"
  Then I am on the Musiclub home page
  When I follow "So What"
  Then I should see "Details about So What"
  And I should see "Miles Davis"

Scenario: back home pressing Home button
    When I follow "Home"
    Then I am on the Musiclub home page

Scenario: back home pressing Musiclub button
    When I follow "Musiclub"
    Then I am on the Musiclub home page
