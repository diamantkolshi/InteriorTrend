require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InteriorTrend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.

    config.load_defaults 6.0

    config.i18n.default_locale = :sq
    config.time_zone = 'Berlin'

    config.autoload_paths += Dir[Rails.root.join("app", "models", "{*/}")]
    config.autoload_paths += %W(#{config.root}/app/lib)
    
    config.action_controller.default_protect_from_forgery = true
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Don't generate system test files.

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost', '127.0.0.1',
                /\.procarement\.com/,
                /https?:\/\/devapp\.uber\.space/,
                /https?:\/\/.+\.appflowapp\.com/,
                /http:\/\/localhost(:\d+)?/,
                /capacitor:\/\/localhost(:\d+)?/,
                /ionic:\/\/localhost(:\d+)?/
        # regular expressions can be used here

        resource '/api/v1/*',
                 :methods => [:get, :post, :put, :delete, :options],
                 :headers => :any,
                 :expose => %w(Access-Token Client uid)
      end
    end
    config.generators.system_tests = nil
  end
end
