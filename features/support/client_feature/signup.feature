Feature: client signup

# Main Function for a client:
# Sign up first if a client doesn't have an account
# I expect to successfully sign up in if I input the valid email and password, and I should not sign up if I am in the exisiting user list

Background: accounts have been added to database

  Given the following account exist
  | name          | email              | password        | admin |
  | Harrison      | harrison@gmail.com | harrison123456  | false |
  | Jack          | jack@gmail.com     | jack123456      | false |


Scenario: login with an account that does not exist
    Given I am on the login page
    When I fill in "user[email]" with "abc@gmail.com"
    And I fill in "password" with "abc123456"
    And I press "Login"
    Then I am on the login page
    Then I should see "User does not exist, please sign in!"


Scenario: sign up with email that does not exist and login with this account
    Given I am on the signup page
    When I fill in "user[name]" with "abc"
    And I fill in "user[email]" with "abc@gmail.com"
    And I fill in "password" with "abc123456"
    And I press "Sign Up"
    Then I am on the login page
    And I should see "Signup successfully!"
    Then I fill in "user[email]" with "abc@gmail.com"
    And I fill in "password" with "abc123456"
    And I press "Login"
    Then I am on the Musiclub home page
    And I should see "abc"
    

Scenario: sign up with an existing email
    Given I am on the signup page
    When I fill in "user[name]" with "Jack"
    And I fill in "user[email]" with "jack@gmail.com"
    And I fill in "password" with "jack123456"
    And I press "Sign Up"
    Then I am on the signup page
    And I should see "This account already exists!"




