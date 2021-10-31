require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RealtimeAichi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    #dotenv
    Dotenv::Railtie.load

  config.load_defaults 5.2
  config.i18n.default_locale = :ja
  config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]

  end
end
