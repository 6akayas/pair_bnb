require_relative 'boot'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'rails/all'
require 'carrierwave/processing/rmagick'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PairBnb
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
