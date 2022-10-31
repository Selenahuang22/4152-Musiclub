# Feature: display list of musics filtered by a specific category

#   # As a concerned parent
#   # So that I can quickly browse movies appropriate for my family
#   # I want to see movies matching only certain MPAA ratings

# Background: music have been added to database

#   Given the following music exist
#   | title                   | category  | release_date |  singer            |
#   | Backroad Therapy        | country   | 28-Oct-2022  |  Alexandra Kay     |
#   | Born to Run             | rock      | 25-Aug-1975  |  Bruce Springsteen |
#   | Shake it Off            | pop       | 19-Aug-2014  |  Taylor Swift      |
#   | Working Man             | blues     | 12-Mar-1974  |  Otis Rush         |
#   | Vespers of 1610         | classical | 01-Sep-1610  |  Monteverdi        |
#   | So What                 | jazz      | 17-Aug-1959  |  Miles Davis       |
#   | You Proof               | country   | 13-May-2022  |  Morgan Wallen     |
#   | Toxic                   | pop       | 13-Jan-2004  |  Britney Spears    |
#   | Rolling in the Deep     | pop       | 26-Sep-2011  |  Adele             |
  

#   And  I am on the Musiclub home page
#   Then 9 seed music should exist

# Scenario: restrict to movies with "rock" or "pop" categories
#   Given I check the following categories: rock, pop
#   And I uncheck the following categories: country, blues, classical, jazz
#   And I press "Refresh"
#   Then I should see the following music: Born to Run, Shake it Off, Toxic, Rolling in the Deep
#   And I should not see the following music: Backroad Therapy, Working Man, Vespers of 1610, So What, You Proof


# Scenario: all categories selected
#   Given I check the following categories: country, rock, pop, blues, classical, jazz
#   And I press "Refresh"
#   Then I should see all the music


