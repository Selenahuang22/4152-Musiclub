Feature: Musiclub manager changes music information or delete a music

# Basic function 2: 
# A manager can update music's information in music details page. He may also remove a music from music board if the song has some problems or Musiclub has no copyrights for the song anymore.

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

# Update the information for a specific music
Scenario: go to new music details page and edit music
  Given I am on the Musiclub home page
  When I follow "More about Shake it Off"
  Then I should see "Details about Shake it Off"
  And I follow "Edit"
  Then I should see "Edit Existing Music"
  When I fill in "music[description]" with "A new description version of Shake it Off"
  And I press "Update Music Info"
  Then I should see "A new description version of Shake it Off"

# Edge case: cancel updating
Scenario: go back to the home page
  Given I am on the Musiclub home page
  When I follow "More about Shake it Off"
  Then I should see "Details about Shake it Off"
  And I follow "Back to music list"
  Then I am on the Musiclub home page

# Remove a music from music board
Scenario: delete a music form Musiclub
  Given I am on the Musiclub home page
  And I should see "Shake it Off"
  When I follow "More about Shake it Off"
  Then I should see "Details about Shake it Off"
  And I follow "Delete"
  Then I am on the Musiclub home page
  And I should not see "Shake it Off"