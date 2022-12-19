Feature: mark the music the client likes to his/her favorite list

# Main function for a client:
# when I meet the music I am interested, I can mark it to my favorite list
# I can see all my favorite on one page, and I can download the music from my favorite list
# I can also remove it from my favorite if I am not interested in it anymore

Background: music have been added to database

  Given the following music exist
  | title                   | category  | release_date |  singer            |
  | Born to Run             | rock      | 25-Aug-1975  |  Bruce             |
  
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
    Then I follow "Home"
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
    Then I am on payment page
    And I should see "Payment Methods"
    When I fill in "Card Number" with "1111222233334444"
    And I fill in "Expiration Date" with "01/2028"
    And I fill in "CVV" with "111"
    And I fill in "Card Holder's Name" with "Alice"
    And I press "Confirm Payment"
    Then I am on my download library page
    And I should see "Born to Run"

# I can access to my favorite music page from Musiclub home page
Scenario: directly go to my favorite music library
    When I follow "My Favorite"
    Then I am on my favorite page
    And I should see "Your Favorite List"

Scenario: back home when pressing Home button
    When I follow "Home"
    Then I am on the Musiclub home page

Scenario: back home when pressing Musiclub button
    When I follow "Musiclub"
    Then I am on the Musiclub home page

# edge case: when I have logged out, I cannot visit my favorite again
Scenario: back home pressing Home button
    When I follow "Log Out"
    Then I am on the login page
    When I go to my favorite page
    Then I am on the login page
    And I should not see "Your Favorite List"




