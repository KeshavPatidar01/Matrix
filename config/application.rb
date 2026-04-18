require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BrainPower
  class Application < Rails::Application
        # **ADD THIS CODE BLOCK HERE**

    # **END OF CODE BLOCK**

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0


    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])
# config/application.rb
config.load_defaults 8.0 # ya jo bhi aapka version hai
config.assets.enabled = true # Yeh zaroori hai
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")








    config.hosts << "miles-unturbulent-exchangeably.ngrok-free.dev"
    config.hosts << /.*\.ngrok-free\.dev$/
  end
end
