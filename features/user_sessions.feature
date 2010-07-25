Feature: User Sessions
  In order to make a game
  As a user
  I want to log in and log out
  
  Scenario: Log In
  When I log in
  Then I should be on the game page
  
  Scenario: Log out
  Given I am logged in
  When I follow "Logout"
  Then I should be on the homepage