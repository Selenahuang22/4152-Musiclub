Feature: download the interested music for playing anywhere, anytime

# Main function for a client:
# when meeting interested music,
# I expect to download it to my personal music collection and play it anywhere, anytime
# In order to download a music, I need to pay for it by adding payment methods

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


Scenario: download a music from the home page
    When I follow "Download"
    Then I am on my download library page
    And I should see "Born to Run"

Scenario: I cannot repeatedly download a music if I have downloaded it before
    When I follow "Download"
    Then I am on my download library page
    And I should see "Born to Run"
    Then I follow "Back to Musiclub"
    And I follow "Download"
    Then I am still on the Musiclub home page

Scenario: directly go to my download music library
    When I follow "My Library"
    Then I am on my download library page
    And I should see "Downloaded Music Library"

Scenario: back to home page when click button from my library
    When I follow "Download"
    Then I am on my download library page
    And I should see "Born to Run"
    When I follow "Back to Musiclub"
    Then I am on the Musiclub home page 

Scenario: remove a music from my library
    When I follow "Download"
    Then I am on my download library page
    And I should see "Born to Run"
    Then I follow "Delete"
    And I should see "Born to Run has been removed from your downloading library"


Scenario: back home pressing Musiclub button
    Given I am on my download library page
    When I follow "Musiclub"
    Then I am on the Musiclub home page


# Scenario: Add payment method

# Potential Scenario: comment on music



