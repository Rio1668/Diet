require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Diet
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    
    config.hosts << "8d8ef5ea83dd42619b3913b8518cb025.vfs.cloud9.ap-northeast-1.amazonaws.com"
    
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local
    
    config.i18n.default_locale = :ja
  end
end
