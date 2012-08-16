source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'thin', '~> 1.4.1'

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'mysql', '~> 2.8.1'
  gem "therubyracer", :require => 'v8' # Required for execjs, OS X has a runtime installed by default
end

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'haml'
gem 'haml-rails'
gem 'bootstrap-sass', '~> 2.0.4.0'
gem 'devise'
gem 'fastercsv' # Only with Ruby 1.8
gem 'rails_admin'
gem 'paperclip', '~> 2.0'
gem 'twitter', '~> 3.6.0'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'
