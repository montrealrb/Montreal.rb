# frozen_string_literal: true

source "https://rubygems.org"
ruby "2.4.0"

# Database
gem "pg"
gem "seed_dump"

# Uploads
gem "carrierwave"
gem "cloudinary"

# Assets
gem "autoprefixer-rails"
gem "bootstrap-sass"
gem "coffee-rails"
gem "font-awesome-sass"
gem "jquery-rails"
gem "sass-rails"
gem "uglifier"

# Application
gem "devise"
gem "friendly_id"
gem "omniauth-github"
gem "omniauth-twitter"
gem "rails", "~> 5.1"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "bourbon"
gem "jquery-turbolinks"
gem "turbolinks"

# View
gem "enumerize"
gem "gemoji"
gem "redcarpet"
gem "simple_form"

# Server
gem "newrelic_rpm", group: :production
gem "unicorn"

# Heroku Assets
gem "rails_12factor", group: :production

# Globalization/Localization
gem "globalize", "~> 5.1.0.beta2"
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
  gem "bullet"
  gem "spring"
  gem "spring-commands-rspec"
end

group :legacy do
  gem "mysql2"
  gem "nokogiri"
end

group :development, :test do
  gem "byebug"
  gem "capybara"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "faker"
  gem "guard-ctags-bundler"
  gem "guard-rspec", require: false
  gem "guard-rubocop"
  gem "pry"
  gem "rspec-its"
  gem "rspec-rails"
  gem "rubocop", "~> 0.50.0", require: false
  gem "shoulda-matchers"
  gem "sqlite3"
  gem "timecop"
end

group :test do
  gem "rails-controller-testing" # this is temporary
  gem "vcr"
  gem "webmock", ">= 1.8.0"
end

gem "coveralls", require: false, group: :test
