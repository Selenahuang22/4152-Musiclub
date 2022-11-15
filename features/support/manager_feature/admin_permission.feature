Feature: Admin has no right to download music or mark music as favorite

# Main function for an admin:
# The responsibility of an admin is to manage the main Musiclub collections, not to use the service as a normal user. So, an admin should not see any "download" or "favorite" function on the page.

Background: music have been added to database

  Given the following music exist
  | title                   | category  | release_date |  singer            |
  | Born to Run             | rock      | 25-Aug-1975  |  Bruce Springsteen |
  
  Given the following account exist
  | name          | email              | password        | admin |
  | Admin         | admin@musiclub.com | Admin           | true  |
  | Jack          | jack@gmail.com     | jack123456      | false |

  Given I am on the login page
  When I fill in "user[email]" with "admin@musiclub.com"
  And I fill in "password" with "Admin"
  And I press "Login"
  Then I am on the Musiclub home page

Scenario: An admin can edit/delete music
    Given I am on the Musiclub home page
    Then I should see "Edit"
    And I should see "Delete"
    And I should not see "Download"
    And I should not see "Favorite"

Scenario: An admin can add new music to the main Musiclub collction
    Given I am on the Musiclub home page
    Then I should see "New music"

Scenario: An admin does not have the downloaded library and favorite list
    Given I am on the Musiclub home page
    Then I should not see "My Library"
    And I should not see "My Favorite"

Scenario: A client cannot download/favorite a music from music detail page either
    Given I am on the Musiclub home page
    And I follow "Born to Run"
    Then I should not see "Download"
    And I should not see "Favorite"
    And I should see "Edit"
    And I should see "Delete"



