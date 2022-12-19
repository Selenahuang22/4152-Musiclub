Feature: client adds comments to the music

# Main function for an admin: 
# An admin can manage the comments from all the users
# The admin is responsible to remove the inapproriate comments

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
  Then I follow "Comment"
  And I fill in "comment[content]" with "xxxxxx"
  Then I press "Add Comment"
  And I should see "Jack: xxxxxx"
  Then I follow "Log Out"

  Then I am on the login page
  When I fill in "user[email]" with "admin@musiclub.com"
  And I fill in "password" with "Admin"
  And I press "Login"
  Then I am on the Musiclub home page
  And I should see "Manage comments"

Scenario: Access the comment list from the home page
    When I follow "Manage comments"
    Then I am on commment management page
    And I should see "Born to Run"
    And I should see "xxxxxx"

Scenario: Access the comment list from the music detail
    When I follow "Born to Run"
    Then I should see "Details about Born to Run"
    And I should see "Manage comments"

Scenario: Remove unsuitable music
    When I follow "Manage comments"
    Then I am on commment management page
    And I should see "xxxxxx"
    When I follow "Remove"
    Then I am on commment management page
    And I should not see "xxxxxx"
    When I follow "Home"
    Then I am on the Musiclub home page
    When I follow "Born to Run"
    Then I should see "Details about Born to Run"
    And I should not see "xxxxxx"

Scenario: The manager cannot add comment
    Given I am on the Musiclub home page
    Then I should not see "Comment"





