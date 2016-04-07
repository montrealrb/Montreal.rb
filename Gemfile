source "https://rubygems.org"
ruby "2.2.4"

# Database
gem "pg"

# Uploads
gem "carrierwave"
gem "cloudinary"

# Assets
gem "autoprefixer-rails", "~> 6.3.6"
gem "bootstrap-sass", "~> 3.3.6"
gem "font-awesome-sass"
gem "coffee-rails", "~> 4.1.0"
gem "jquery-rails"
gem "sass-rails"
gem "uglifier", "~> 3.0.0"
gem "sprockets", "~> 3.0"

# Application
gem "rails", "~> 4.2"
gem "omniauth-github"
gem "friendly_id", "~> 5.1.0"
gem "devise", "~> 3.5.2"

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
gem "administrate", "~> 0.1.5"

# Ops
gem "bugsnag"

gem "reverse_markdown"

group :development do
  gem "annotate"
  gem "quiet_assets"
  gem "spring"
  gem "spring-commands-rspec"
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
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "rubocop", require: false
  gem "sqlite3"
  gem "timecop"
end

gem "coveralls", require: false, group: :test
