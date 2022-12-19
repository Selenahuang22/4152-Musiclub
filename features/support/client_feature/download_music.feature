Feature: download the interested music for playing anywhere, anytime

# Main function for a client:
# when I meet the music I want to download and own it, I can add it to my personal music collection by paying for it, and then I can download the original mp3 file to my local computer anytime later
# I can access my downloaded music list from anywhere
# I can also remove the music if I don't want to own it anymore or if I have downloaded it many times. （but not recommended cause you have already paid！）

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

Scenario: download a music from the home page and make payment successfully
    When I follow "Download"
    Then I am on payment page
    And I should see "Payment Methods"
    When I fill in "Card Number" with "1111222233334444"
    And I fill in "Expiration Date" with "01/2028"
    And I fill in "CVV" with "111"
    And I fill in "Card Holder's Name" with "Alice"
    And I press "Confirm Payment"
    Then I am on my download library page
    And I should see "Born to Run"

Scenario: download a music from the home page and make payment unsuccessfully
    When I follow "Download"
    Then I am on payment page
    And I should see "Payment Methods"
    When I fill in "Card Number" with "1111222233334444"
    And I fill in "Expiration Date" with "01/01/2028"
    And I fill in "CVV" with "111"
    And I fill in "Card Holder's Name" with "Alice"
    And I press "Confirm Payment"
    Then I am still on payment page
    And I should see "Invalid payment information"


Scenario: I cannot repeatedly download a music if I have downloaded it before
    When I follow "Download"
    Then I am on payment page
    And I should see "Payment Methods"
    When I fill in "Card Number" with "1111222233334444"
    And I fill in "Expiration Date" with "01/2028"
    And I fill in "CVV" with "111"
    And I fill in "Card Holder's Name" with "Alice"
    And I press "Confirm Payment"
    Then I am on my download library page
    And I should see "Born to Run"
    Then I follow "Home"
    And I follow "Download"
    Then I am still on the Musiclub home page

# I can access to my downloaded music page from anywhere
Scenario: directly go to my download music library
    When I follow "My Library"
    Then I am on my download library page
    And I should see "Downloaded Music Library"

Scenario: back to home page when click button from my library
    When I follow "Download"
    Then I am on payment page
    And I should see "Payment Methods"
    When I fill in "Card Number" with "1111222233334444"
    And I fill in "Expiration Date" with "01/2028"
    And I fill in "CVV" with "111"
    And I fill in "Card Holder's Name" with "Alice"
    And I press "Confirm Payment"
    Then I am on my download library page
    And I should see "Born to Run"
    When I follow "Download to local"
    Then I am on my download library page
    # here, I should see a music has been downloaded to my local computer

Scenario: remove a music from my library
    When I follow "Download"
    Then I am on payment page
    And I should see "Payment Methods"
    When I fill in "Card Number" with "1111222233334444"
    And I fill in "Expiration Date" with "01/2028"
    And I fill in "CVV" with "111"
    And I fill in "Card Holder's Name" with "Alice"
    And I press "Confirm Payment"
    Then I am on my download library page
    And I should see "Born to Run"
    Then I follow "Delete"
    And I should see "Born to Run has been removed from your downloading library"


Scenario: back home when pressing Musiclub button
    Given I am on my download library page
    When I follow "Musiclub"
    Then I am on the Musiclub home page

Scenario: back home when pressing Home button
    Given I am on my download library page
    When I follow "Home"
    Then I am on the Musiclub home page

# edge case: when I have logged out, I cannot visit my download again
Scenario: back home pressing Home button
    When I follow "Log Out"
    Then I am on the login page
    When I go to my download library page
    Then I am on the login page
    And I should not see "Downloaded Music Library"




