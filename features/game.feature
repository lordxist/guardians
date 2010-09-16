Feature: Game

  Scenario: A user can visit the game page
  Given a user named "test"
    And I authenticate as the user named "test"
  When I go to the game page
  Then I should see "Logout"