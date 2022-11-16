Feature: admin login and logout

# Basic Function for an admin:
# before entering the main page, login first
# I expect to successfully log in if I input the corrent email and password, and I should not log in if I am not in the exisiting user list or I input a wrong password

Background: accounts have been added to database

  Given the following account exist
  | name          | email              | password        | admin |
  | Admin         | admin@musiclub.com | Admin           | true  |


Scenario: login with correct password and email
    Given I am on the login page
    When I fill in "user[email]" with "admin@musiclub.com"
    And I fill in "password" with "Admin"
    And I press "Login"
    Then I am on the Musiclub home page
    Then I should see "Log Out"
    And I should see "Admin"

Scenario: login with incorrect password and correct email
    Given I am on the login page
    When I fill in "user[email]" with "admin@musiclub.com"
    And I fill in "password" with "Admin1"
    And I press "Login"
    Then I am on the login page
    And I should see "Invalid user or password!"

Scenario: login with incorrect email and correct password
    Given I am on the login page
    When I fill in "user[email]" with "admin1@musiclub.com"
    And I fill in "password" with "Admin"
    And I press "Login"
    Then I am on the login page
    And I should see "User does not exist, please sign in!"

Scenario: login with incorrect email and incorrect password
    Given I am on the login page
    When I fill in "user[email]" with "admin1@musiclub.com"
    And I fill in "password" with "Admin1"
    And I press "Login"
    Then I am on the login page
    And I should see "User does not exist, please sign in!"

Scenario: login with unregistered account
    Given I am on the login page
    When I fill in "user[email]" with "ja@gmail.com"
    And I fill in "password" with "jac123456"
    And I press "Login"
    Then I am on the login page
    And I should see "User does not exist, please sign in!"

Scenario: login and logout
    Given I am on the login page
    When I fill in "user[email]" with "admin@musiclub.com"
    And I fill in "password" with "Admin"
    And I press "Login"
    Then I am on the Musiclub home page
    Then I should see "Log Out"
    And I should see "Admin"
    When I follow "Log Out"
    Then I am on the login page