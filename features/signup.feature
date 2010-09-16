Feature: Signup

  Scenario: I can sign up as a new user
  When I go to the signup page
  And I fill in "Username" with "test"
  And I fill in "Email" with "test@example.com"
  And I fill in "Password" with "test-password"
  And I fill in "Password confirmation" with "test-password"
  And I press "Sign Up"
  Then I should see "Registration successful!"