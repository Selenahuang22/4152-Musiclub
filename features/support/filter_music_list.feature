Feature: display list of musics filtered by a specific category or a specific singer

# Basic Function 1 for a client and an admin:
# when browsing music on the homepage,
# I expect to filter the music list based on my preferred features, like music cateogories, singers, etc.

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

# filter by categories
Scenario: restrict to musics with "rock" or "pop" categories
  Given I check the following categories: rock, pop
  And I uncheck the following categories: country, blues, classical, jazz
  And I press "Refresh"
  Then I should see the following music: Born to Run, Shake it Off, Toxic, Rolling in the Deep
  And I should not see the following music: Backroad Therapy, Working Man, Vespers of 1610, So What, You Proof

# default setting: all categories are defaultly selected when first entering the application
Scenario: all categories selected
  Given I check the following categories: country, rock, pop, blues, classical, jazz
  And I press "Refresh"
  Then I should see all the music


# TODO in iter 2: 

# Scenario: filter musiclist by more features, like singer, with chekcing box

# Scenario: create a search bar to enable clients perform title searching and filter the results based on user input


