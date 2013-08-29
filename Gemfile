source 'https://rubygems.org'

# https://devcenter.heroku.com/articles/ruby-versions
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'rails-i18n'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Authentication. Read more:  https://github.com/plataformatec/devise
gem 'devise', ">= 3.0.2"

# Use haml as template
gem 'haml'
gem 'haml-rails'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem 'bootstrap-sass'
gem 'flat-ui-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

# Rails 12factor
gem 'rails_12factor', group: :production

group :test, :development do
  gem 'debugger'

  # Use Capistrano for deployment
  gem 'capistrano'

  gem 'rspec-rails', '~> 2.0'
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  # temporarily downgraded to v1.0.1 as per issue https://github.com/bmabey/database_cleaner/issues/224
  gem 'database_cleaner', '=1.0.1'
  gem 'capybara-webkit'
  gem 'factory_girl_rails'
end
