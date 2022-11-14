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

# A song with some information not provided shouldn't be added
Scenario: fail to create new music with music title not provided
  Given I am on the create page
  When I fill in "music[title]" with ""
  When I select "country" from "music[category]"
  When I fill in "music[description]" with "A popular music for Taylor Swift"
  When I select "2019" from "music[release_date(1i)]"
  When I select "October" from "music[release_date(2i)]"
  When I select "29" from "music[release_date(3i)]"
  When I fill in "music[singer]" with "Taylor Swift"
  And I press "Save Changes"
  Then I am on the Musiclub home page
  And I should see "One or more information of the new song weren't filled, creation failed"
  
# A song with some information not provided shouldn't be added
Scenario: fail to create new music with music description not provided
  Given I am on the create page
  When I fill in "music[title]" with "Blank Space"
  When I select "country" from "music[category]"
  When I fill in "music[description]" with ""
  When I select "2019" from "music[release_date(1i)]"
  When I select "October" from "music[release_date(2i)]"
  When I select "29" from "music[release_date(3i)]"
  When I fill in "music[singer]" with "Taylor Swift"
  And I press "Save Changes"
  Then I am on the Musiclub home page
  And I should see "One or more information of the new song weren't filled, creation failed"
  And I should not see "Blank Space"

# A song with some information not provided shouldn't be added
Scenario: fail to create new music with music singer not provided
  Given I am on the create page
  When I fill in "music[title]" with "Blank Space"
  When I select "country" from "music[category]"
  When I fill in "music[description]" with "A popular music for Taylor Swift"
  When I select "2019" from "music[release_date(1i)]"
  When I select "October" from "music[release_date(2i)]"
  When I select "29" from "music[release_date(3i)]"
  When I fill in "music[singer]" with ""
  And I press "Save Changes"
  Then I am on the Musiclub home page
  And I should see "One or more information of the new song weren't filled, creation failed"
  And I should not see "Blank Space"

# Edge case: cancel adding
Scenario: cancel creating new music
  Given I am on the create page
  When I follow "Cancel"
  Then I am on the Musiclub home page 