# frozen_string_literal: true
source "https://rubygems.org"
ruby "2.4.0"

# Database
gem "pg"

# Uploads
gem "carrierwave"
gem "cloudinary"

# Assets
gem "autoprefixer-rails"
gem "bootstrap-sass"
gem "font-awesome-sass"
gem "coffee-rails"
gem "jquery-rails"
gem "sass-rails"
gem "uglifier"

# Application
gem "rails", "~> 5.1"
gem "omniauth-github"
gem "omniauth-twitter"
gem "friendly_id"
gem "devise"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks"
gem "jquery-turbolinks"
gem "bourbon"

# View
gem "simple_form"
gem "enumerize"
gem "redcarpet"
gem "gemoji"

# Server
gem "unicorn"
gem "newrelic_rpm", group: :production

# Heroku Assets
gem "rails_12factor", group: :production

# Globalization/Localization
gem "globalize", '~> 5.1.0.beta2'
gem "globalize-accessors"

# Administration
gem "administrate"

# Ops
gem "bugsnag"

gem "reverse_markdown"

# Communication
gem "twitter"

# Utility
gem "colorize"

group :development do
  gem "annotate"
  gem "spring"
  gem "spring-commands-rspec"
  gem "bullet"
end

group :legacy do
  gem "mysql2"
  gem "nokogiri"
end

group :development, :test do
  gem "capybara"
  gem "factory_girl_rails"
  gem "faker"
  gem "guard-ctags-bundler"
  gem "guard-rspec", require: false
  gem "guard-rubocop"
  gem "pry"
  gem "byebug"
  gem "dotenv-rails"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "rspec-its"
  gem "rubocop", "~> 0.45.0", require: false
  gem "sqlite3"
  gem "timecop"
end

group :test do
  gem "vcr"
  gem "webmock", ">= 1.8.0"
  gem 'rails-controller-testing' #this is temporary
end

gem "coveralls", require: false, group: :test
