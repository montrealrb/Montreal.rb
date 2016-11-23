# frozen_string_literal: true
require File.expand_path("../boot", __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MontrealRb
  class Application < Rails::Application
    config.time_zone = "America/Montreal"

    config.i18n.default_locale = :en
    config.i18n.available_locales = %i(en fr)
    config.i18n.enforce_available_locales = true
    config.active_record.raise_in_transactional_callbacks = true
    config.to_prepare do
      Administrate::ApplicationController.helper MontrealRb::Application.helpers
    end
  end
end
