require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lvee
  class Application < Rails::Application
    require 'i18n_database_backend'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.active_record.schema_format = :sql

   config.action_controller.cache_store = :file_store, File.join(Rails.root, "cache") #TODO

   config.generators do |g|
     g.orm             :active_record
     g.template_engine :haml
     g.test_framework  :rspec, :fixture => false
     g.stylesheets     false
   end

  end
end
