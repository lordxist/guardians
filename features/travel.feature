Feature: Travel

  Scenario: A user can travel
  Given a user named "test"
    And I authenticate as the user named "test"
  When I go to the travel page
    And I fill in "X dest" with "100"
    And I fill in "Y dest" with "100"
    And I press "Travel"
  Then I should see "Travelling to: (100,100)"
