require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Web
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    ## Custom
    # Don't run un-required generations of files
    config.generators do |g|
      g.test_framework :rspec,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: false
      g.helper false
      # Uncomment if using React/Others for View
      g.assets false
      g.template_engine false
    end

    # Handle exceptions the manual way in API-only app
    config.exceptions_app = self.routes

    # Customize to local timezone - IST
    config.time_zone = "Mumbai"

    # Handle CORS for quotes endpoint
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '/quotes', headers: :any, methods: [:get, :options]
        resource '/quotes/*', headers: :any, methods: [:get, :options]
      end
    end
  end
end
