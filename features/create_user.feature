Feature: Create User
  As a user
  I want to register
  
  Scenario: Sign Up
  Given I am on the homepage
  And I follow "Sign Up"
  When I fill in "Username" with "test"
  And I fill in "Email" with "test@example.com"
  And I fill in "Password" with "password"
  And I fill in "Password Confirmation" with "password"
  And I press "Sign Up"
  Then I should see "Registration successful!"
  When I follow "Back"
  Then I should be on the homepage
  
  Scenario: Quit Sign Up
  Given I am on the new user page
  And I follow "Back"
  Then I should be on the homepage