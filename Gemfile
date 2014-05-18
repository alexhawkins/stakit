source 'https://rubygems.org'

ruby '2.0.0'
#ruby-gemset=railstutorial_rails_4_0
gem 'rails', '4.0.5'


# Use PG for Heroku production environment
group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end
# Use Sqlite3 for development environment
group :development do
  gem 'sqlite3', '1.3.8'
end
# Use Twitter Bootsrap Framework
gem 'bootstrap-sass', '~> 3.1.1'

# Use SCSS for stylesheets
gem 'sass-rails', '4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '4.0.1'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
#gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks', '1.1.1'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

######ADDED GEMS############
group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
end

gem 'thin', group: :development
gem 'newrelic_rpm'
gem 'devise'
# handle sensitive data with environment variables
gem 'figaro'
gem 'pundit'
gem 'chosen-rails'
gem 'best_in_place', github: 'bernat/best_in_place'
gem 'bootstrap-x-editable-rails'
#gem 'x-editable-rails'
#gem 'rails3-jquery-autocomplete'


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
