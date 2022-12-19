Feature: Musiclub manager changes music information or delete a music on the home page

# Main function for an admin: 
# An admin can update music's information or delete it in the homepage page. 

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
  And I should see "Born to Run"

# Update the information for a specific music
Scenario: edit music on the homw page
  Given I am on the Musiclub home page
  And I should see "Born to Run"
  When I follow "Edit"
  Then I should see "Edit Existing Music"
  When I fill in "music[description]" with "A new description version"
  And I press "Update Music Info"
  Then I should see "A new description version"

# Remove a music from music board on the home page
Scenario: delete a music form Musiclub on the home page
  Given I am on the Musiclub home page
  And I should see "Born to Run"
  And I follow "Delete"
  Then I am on the Musiclub home page
  And I should not see "Born to Run"