Feature: Musiclub manager adds new music into music repository

# Basic function 1: 
# A manager will need to add (create) new music to music home page a new song published and Musiclub obtained the copyright for users to listen / download

# Access creation page to add new music
Scenario: go to new music creation page
  Given I am on the Musiclub home page
  When I follow "New music"
  Then I go to the create page

# Add music based on information provided
Scenario: create new music
  Given I am on the create page
  When I fill in "music[title]" with "Red"
  When I select "country" from "music[category]"
  When I fill in "music[description]" with "red music"
  When I select "2018" from "music[release_date(1i)]"
  When I select "October" from "music[release_date(2i)]"
  When I select "22" from "music[release_date(3i)]"
  When I fill in "music[singer]" with "Taylor Swift"
  And I press "Save Changes"
  Then I am on the Musiclub home page
  And I should see "Red"

# Edge case: cancel adding
Scenario: cancel creating new music
  Given I am on the create page
  When I follow "Cancel"
  Then I am on the Musiclub home page 