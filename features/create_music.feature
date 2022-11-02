Feature: View music details and perform editing, deleting

Scenario: go to new music creation page
  Given I am on the Musiclub home page
  When I follow "Add new music"
  Then I go to the create page

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

Scenario: cancel creating new music
  Given I am on the create page
  When I follow "Cancel"
  Then I am on the Musiclub home page 