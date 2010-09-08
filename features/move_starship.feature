Feature: Move Starship
  As an authenticated user
  I want to move my starship
  
  Scenario: Initiate Movement
  Given I am logged in
  When I go to the travel page
  When I fill in "X Pos" with "50"
  And I fill in "Y Pos" with "50"
  And I press "Travel"
  Then I should not see "X Pos"