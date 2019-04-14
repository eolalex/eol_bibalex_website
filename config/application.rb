# require 'ar-extensions'
require_relative 'boot'

require 'rails/all'
require 'acts_as_list'
# require 'sprockets/railtie'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
# Bundler.require(*Rails.groups(assets: %w(development test)))
# Bundler.require(:default, :assets, Rails.env)

module EolPublishingLayer
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.i18n.available_locales = [:en, :ar]
    
    config.middleware.insert_before ActionDispatch::Static, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end
    config.action_dispatch.default_headers = {
    'Access-Control-Allow-Origin' => '*',
    'Access-Control-Request-Method' => 'GET, PATCH, PUT, POST, OPTIONS, DELETE',
    'Access-Control-Allow-Headers:' => 'Origin, X-Requested-With, Content-Type, Accept'
}
RenderAsync.configure do |config|
  config.turbolinks = true # Enable this option if you are using Turbolinks 5+
end


# Rails.application.config.public_file_server.enabled = true
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  end
end
