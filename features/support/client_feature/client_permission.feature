Feature: client has no permission to manage the main Musiclub collection

# Main function for a client:
# A client should not be able to add/edit/delete music to the main Musiclub collection

Background: music have been added to database

  Given the following music exist
  | title                   | category  | release_date |  singer            |
  | Born to Run             | rock      | 25-Aug-1975  |  Bruce Springsteen |
  
  Given the following account exist
  | name          | email              | password        | admin |
  | Admin         | admin@musiclub.com | Admin           | true  |
  | Jack          | jack@gmail.com     | jack123456      | false |

  Given I am on the login page
  When I fill in "user[email]" with "jack@gmail.com"
  And I fill in "password" with "jack123456"
  And I press "Login"
  Then I am on the Musiclub home page

Scenario: A client cannot edit/delete music
    Given I am on the Musiclub home page
    Then I should see "Download"
    And I should see "Favorite"
    And I should not see "Edit"
    And I should not see "Delete"

Scenario: A client cannot add new music
    Given I am on the Musiclub home page
    Then I should not see "New music"

Scenario: A client can see the link to his/her downloaded library and favorite list
    Given I am on the Musiclub home page
    Then I should see "My Library"
    And I should see "My Favorite"

Scenario: A client cannot edit/delete a music from music detail page either
    Given I am on the Musiclub home page
    And I follow "Born to Run"
    Then I should see "Download"
    And I should see "Favorite"
    And I should not see "Edit"
    And I should not see "Delete"



