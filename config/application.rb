require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Widget
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.public_file_server.enabled = true
    config.assets.enabled = true
    config.assets.compile = true
    config.assets.precompile << /\.(?:css|js|scss|svg|eot|woff2|woff|ttf|otf|png|jpg|jpeg|gif|ico|mp4|webm)$/
    config.autoload_paths += %W(#{config.root}/lib)
  end
end
