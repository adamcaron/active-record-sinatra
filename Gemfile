source 'https://rubygems.org'

gem 'sinatra', require: 'sinatra/base'
gem 'sqlite3'
gem 'activerecord'
gem 'sinatra-activerecord' # gives us access to rake tasks

group :development, :test do # group is used by bundler if you specify which group you want. For instance, this doesn't require these gems for production env.
  gem 'shotgun' # runs our server
  gem 'minitest'
  gem 'tux' # allows us console interaction to our database, more readable interaction method than the binary in a sqlite db text file
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner'
end
