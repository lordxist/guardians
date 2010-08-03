Feature: Edit Trade Settings
  In order to make a game
  As a user
  I want to edit the trade settings
  
  Scenario: Edit Buying Durasteel
  Given I am logged in
  When I fill in "Buying Durasteel" with "300"
  And I press "Update"
  Then I should see "Buying durasteel up to a supply of 300"
  And I should not see "Selling durasteel up to a supply of"
  
  Scenario: Edit Buying Plasteel
  Given I am logged in
  When I fill in "Buying Plasteel" with "300"
  And I press "Update"
  Then I should see "Buying plasteel up to a supply of 300"
  And I should not see "Selling plasteel up to a supply of"
  
  Scenario: Edit Buying Tibanna
  Given I am logged in
  When I fill in "Buying Tibanna" with "300"
  And I press "Update"
  Then I should see "Buying tibanna up to a supply of 300"
  And I should not see "Selling tibanna up to a supply of"

  Scenario: Edit Selling Durasteel
  Given I am logged in
  When I fill in "Selling Durasteel" with "300"
  And I press "Update"
  Then I should see "Selling durasteel up to a supply of 300"
  And I should not see "Buying durasteel up to a supply of"
  
  Scenario: Edit Selling Plasteel
  Given I am logged in
  When I fill in "Selling Plasteel" with "300"
  And I press "Update"
  Then I should see "Selling plasteel up to a supply of 300"
  And I should not see "Buying plasteel up to a supply of"
  
  Scenario: Edit Selling Tibanna
  Given I am logged in
  When I fill in "Selling Tibanna" with "300"
  And I press "Update"
  Then I should see "Selling tibanna up to a supply of 300"
  And I should not see "Buying tibanna up to a supply of"
  
  Scenario: Alter Price
  Given I am logged in
  When I fill in "Selling Durasteel" with "300"
  And I fill in "Selling Durasteel Price" with "15"
  And I press "Update"
  Then I should see "Selling durasteel up to a supply of 300 - Price: 15 cr."