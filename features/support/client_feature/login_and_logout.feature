Feature: client login and logout

Background: accounts have been added to database

  Given the following account exist
  | name          | email              | password        |
  | Harrison      | harrison@gmail.com | harrison123456  |
  | Jack          | jack@gmail.com     | jack123456      | 
  | Noora         | noora@gmail.com    | noora123456     | 
  | Holy          | holy@gmail.com     | holy123456      | 
  | Marrisa       | marrisa@gmail.com  | marrisa123456   |
  | Du            | du@gmail.com       | du123456        | 
  | Toxic         | toxic@gmail.com    | toxic123456     |  
  | Fun           | fun@gmail.com      | fun123456       | 
  | Silvia        | silvia@gmail.com   | silvia123456    | 
  | Henry         | henry@gmail.com    | henry123456     | 
  | Jia           | jia@gmail.com      | jia123456       | 
  | Yuhao         | yuhao@gmail.com    | yuhao123456     | 
  | Lisa          | lisa@gmail.com     | lisa123456      | 
  | Boyu          | boyu@gmail.com     | boyu123456      | 
  | Alexander     | alexander@gmail.com| alexander123456 | 


Scenario: login with correct password and email
    Given I am on the login page
    When I fill in "user[email]" with "jack@gmail.com"
    And I fill in "password" with "jack123456"
    And I press "Login"
    Then I am on the Musiclub home page
    Then I should see "Log Out"
    And I should see "Jack"

Scenario: login with incorrect password and correct email
    Given I am on the login page
    When I fill in "user[email]" with "jack@gmail.com"
    And I fill in "password" with "jack1234567"
    And I press "Login"
    Then I am on the login page
    And I should see "Invalid user or password!"

Scenario: login with incorrect email and correct password
    Given I am on the login page
    When I fill in "user[email]" with "jack1@gmail.com"
    And I fill in "password" with "jack123456"
    And I press "Login"
    Then I am on the login page
    And I should see "User does not exist, please sign in!"

Scenario: login with incorrect email and incorrect password
    Given I am on the login page
    When I fill in "user[email]" with "jack1@gmail.com"
    And I fill in "password" with "jack1234567"
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
    When I fill in "user[email]" with "jack@gmail.com"
    And I fill in "password" with "jack123456"
    And I press "Login"
    Then I am on the Musiclub home page
    Then I should see "Log Out"
    And I should see "Jack"
    When I follow "Log Out"
    Then I am on the login page