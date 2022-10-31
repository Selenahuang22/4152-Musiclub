Feature: Create new music to music board

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
  
  And  I am on the Musiclub home page
  Then 9 seed music should exist

Scenario: go to new music details page
  Given I am on the Musiclub home page
  When I follow "More about Shake it Off"
  Then I should see "Details about Shake it Off"

# Scenario: create new music
#   Given I am on the create page
#   When I fill in "music[title]" with "Red"
#   When I select "country" from "music[category]"
#   When I fill in "music[description]" with "red music"
#   When I select "2018" from "music[release_date(1i)]"
#   When I select "October" from "music[release_date(2i)]"
#   When I select "22" from "music[release_date(3i)]"
#   When I fill in "music[singer]" with "Taylor Swift"
#   And I press "Save Changes"
#   Then I am on the Musiclub home page
#   And I should see "Red"

# Scenario: cancel creating new music
#   Given I am on the create page
#   When I follow "Cancel"
#   Then I am on the Musiclub home page 