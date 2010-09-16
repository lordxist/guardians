Feature: Login

  Scenario: Login redirects to the game page
  Given a user named "test"
    And I authenticate as the user named "test"
  Then I should see "Logout"