Feature: Trade Settings

  Scenario: A user can change the selling settings
  Given a user named "test"
    And I authenticate as the user named "test"
  When I go to the game trade settings page
    And I fill in "Selling durasteel" with "100"
    And I fill in "Selling durasteel price" with "10"
    And I press "Update"
  Then I should see "Selling durasteel up to a supply of 100 à 10 cr."

  Scenario: A user can change the buying settings
  Given a user named "test"
    And I authenticate as the user named "test"
  When I go to the game trade settings page
    And I fill in "Buying durasteel" with "100"
    And I fill in "Buying durasteel price" with "10"
    And I press "Update"
  Then I should see "Buying durasteel up to a supply of 100 à 10 cr. max."