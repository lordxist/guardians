source 'http://rubygems.org'

gem 'rails', '3.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3-ruby', '1.2.5', :require => 'sqlite3'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

gem 'authlogic', :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3'
gem 'inherited_resources', '1.1.2'

gem 'acts_as_fu'

group :test, :development do
  gem 'rspec-rails', :git => 'git://github.com/rspec/rspec-rails', :ref => '2ddb0778dfe9e016cd4b3ae3245d9b08a8f4b60c'
  gem 'factory_girl_rails'
  gem 'mocha'
end

group :cucumber do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails', '0.3.2'
  gem 'cucumber'
  gem 'rspec-rails', :git => 'git://github.com/rspec/rspec-rails', :ref => '2ddb0778dfe9e016cd4b3ae3245d9b08a8f4b60c'
  gem 'spork'
  gem 'launchy'
  gem 'factory_girl_rails'
end
