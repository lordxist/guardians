Given /^a user named "([^"]*)"$/ do |name|
  password = "#{name}-password"
  Factory(:user,
    :username => name,
    :password => password,
    :password_confirmation => password
  )
end

Given /^I authenticate as the user named "([^"]*)"$/ do |name|
  visit root_path
  Then "fill in \"Username\" with \"#{name}\""
  Then "fill in \"Password\" with \"#{name}-password\""
  Then "press \"Login\""
end
