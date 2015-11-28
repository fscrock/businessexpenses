require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Businessapp
  class Application < Rails::Application
    config.generators do |g|
      g.orm :mongo_mapper
    end
    config.active_record.raise_in_transactional_callbacks = true
  end
end
