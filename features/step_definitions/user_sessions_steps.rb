def user
  @user ||= Factory :user
end

def login
  visit path_to("the homepage")
  fill_in "Username", :with => user.username 
  fill_in "Password", :with => "password"
  click_button "Login"
end

When /^I log in$/ do
  login
end

Given /^I am logged in$/ do
  login
end
