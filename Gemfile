source "https://rubygems.org"
ruby "2.2.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 4.2.2"

# Database
gem "pg"

# Uploads
gem "carrierwave"
gem "cloudinary"

# Assets
gem "devise", "~> 3.5.2"
gem "omniauth-github"
gem "autoprefixer-rails", "~> 6.1.0"
gem "bootstrap-sass", "~> 3.3.6"
gem "font-awesome-sass"
gem "coffee-rails", "~> 4.1.0"
gem "jquery-rails"
gem "sass-rails"
gem "uglifier", ">= 1.3.0"
gem "sprockets", "~> 3.0"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks"

# View
gem "simple_form"
gem "enumerize"
gem "redcarpet"

# Server
gem "unicorn"
gem "newrelic_rpm", group: :production

# Heroku Assets
gem "rails_12factor", group: :production

# Globalization/Localization
gem "globalize"
gem "globalize-accessors"

# Administration
gem "administrate", "~> 0.1.1"

# Ops
gem "bugsnag"

group :development do
  gem "annotate"
  gem "quiet_assets"
  gem "spring"
  gem "spring-commands-rspec"
end

group :legacy do
  gem "mysql2"
  gem "reverse_markdown"
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
  gem "rspec-rails"
  gem "rubocop", require: false
  gem "sqlite3"
  gem "timecop"
end

gem "coveralls", require: false, group: :test
