Feature: Restricted Game Page
  In order to make a game
  As an unauthenticated user
  I should not see the game page
  
  Scenario: Redirect Unauthenticated User
  When I go to the game page
  Then I should be on the homepage