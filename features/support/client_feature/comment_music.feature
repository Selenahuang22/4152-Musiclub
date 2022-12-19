Feature: client adds comments to the music

# Main function for a client:
# when meeting the music he/she wants to say something,
# add comment to it,
# then everyone accessing the details of the music can see his/her comments

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

Scenario: add comment to a music from the home page
    When I follow "Comment"
    Then I am on adding commment page
    And I should see "Add Comment to Born to Run"
    When I fill in "comment[content]" with "great music!"
    And I press "Add Comment"
    Then I should see "Details about Born to Run"
    And I should see "Jack: great music!"

Scenario: I can repeatedly add comments to a music
    When I follow "Comment"
    Then I am on adding commment page
    And I should see "Add Comment to Born to Run"
    When I fill in "comment[content]" with "great music!"
    And I press "Add Comment"
    Then I should see "Details about Born to Run"
    And I should see "Jack: great music!"
    Then I follow "Comment"
    Then I am on adding commment page
    When I fill in "comment[content]" with "love it!"
    And I press "Add Comment"
    Then I should see "Details about Born to Run"
    And I should see "Jack: great music!"
    And I should see "Jack: love it!"

Scenario: cancel adding comment
    When I follow "Comment"
    Then I am on adding commment page
    And I should see "Add Comment to Born to Run"
    Then I follow "Cancel"
    Then I should see "Details about Born to Run"
    And I should see "No comments have been added"





