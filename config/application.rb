require_relative 'boot'

require 'rails/all'
require 'pathname'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsPokedex
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets_base_path 	= Rails.root.join('public', 'media', 'pokemons', 'v1')
    config.assets_relative_path = Pathname.new(File.join('media', 'pokemons', 'v1'))
  end
end
