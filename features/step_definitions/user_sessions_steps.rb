def user
  @user ||= Factory :user
end

def login
  user
  visit path_to("the homepage")
  fill_in "Username", :with => user.username 
  fill_in "Password", :with => "password"
  click_button "Login"
end

Given /^I am a registered user$/ do
  user
end

When /^I log in$/ do
  login
end

Given /^I am logged in$/ do
  login
end
