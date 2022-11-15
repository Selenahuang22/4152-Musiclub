Feature: mark the music the client likes to his/her favorite list

# Main function for a client:
# when meeting interested music,
# mark it to my favorite list,
# I can see all my favorite on one page, and I can download the music from my favorite list
# I can also remove it from my favorite if I am not interest on it anymore

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

Scenario: mark a music as favorite
    When I follow "Favorite"
    Then I am on my favorite page
    And I should see "Born to Run"

Scenario: I cannot repeatedly add a music to my favorite if I have added it before
    When I follow "Favorite"
    Then I am on my favorite page
    And I should see "Born to Run"
    Then I follow "Back to Musiclub"
    And I follow "Favorite"
    Then I am still on the Musiclub home page

Scenario: remove a music from favorite
    When I follow "Favorite"
    Then I am on my favorite page
    And I should see "Born to Run"
    Then I follow "Remove"
    Then I am on my favorite page
    And I should not see "Born to Run"

Scenario: download a music from favorite
    When I follow "Favorite"
    Then I am on my favorite page
    And I should see "Born to Run"
    Then I follow "Download"
    Then I am on my download library page
    And I should see "Born to Run"

Scenario: directly go to my favorite music library
    When I follow "My Favorite"
    Then I am on my favorite page
    And I should see "Your Favorite List"

Scenario: back home pressing Home button
    When I follow "Home"
    Then I am on the Musiclub home page

Scenario: back home pressing Musiclub button
    When I follow "Musiclub"
    Then I am on the Musiclub home page




