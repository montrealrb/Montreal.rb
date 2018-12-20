# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= "test"
require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
# Add additional requires below this line. Rails is not loaded until this point!
require "devise"
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

require "vcr"
require "webmock/rspec"
WebMock.disable_net_connect!(allow_localhost: true)

env_vars = %w(SLACK_TOKEN TWITTER_CONSUMER_KEY TWITTER_CONSUMER_SECRET
              TWITTER_ACCESS_TOKEN TWITTER_ACCESS_SECRET CLOUDINARY_URL)

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  env_vars.each do |var|
    config.filter_sensitive_data("<#{var}>") { ENV[var] ||= "optional" }
  end
end

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.render_views

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
  config.include(OmniauthMacros)

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include ControllerMacros, type: :controller
  config.include ActiveSupport::Testing::TimeHelpers

  # Add VCR to all tests
  config.around(:each) do |example|
    options = example.metadata[:vcr] || {}
    if options[:record] == :skip
      VCR.turned_off(&example)
    else
      name = example.metadata[:full_description].
             split(/\s+/, 2).
             join("/").
             underscore.
             tr(".", "/").
             gsub(%r([^\w/]+), "_").
             gsub(%r(/$), "")
      VCR.use_cassette(name, options, &example)
    end
  end
end

OmniAuth.config.test_mode = true
