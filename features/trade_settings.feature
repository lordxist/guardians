Feature: Trade Settings

  Scenario: A user can change the selling settings
  Given a user named "test"
    And I authenticate as the user named "test"
  When I go to the trade settings page
    And I fill in "starship_selling_durasteel_downto" with "100"
    And I fill in "starship_selling_durasteel_price" with "10"
    And I check "starship_enable_selling_durasteel"
    And I press "Update"
  Then the "starship_selling_durasteel_downto" field should contain "100"
    And the "starship_selling_durasteel_price" field should contain "10"
    And the "starship_enable_selling_durasteel" checkbox should be checked

  Scenario: A user can change the buying settings
  Given a user named "test"
    And I authenticate as the user named "test"
  When I go to the trade settings page
    And I fill in "starship_buying_durasteel_upto" with "100"
    And I fill in "starship_buying_durasteel_price" with "10"
    And I press "Update"
  Then the "starship_buying_durasteel_upto" field should contain "100"
    And the "starship_buying_durasteel_price" field should contain "10"