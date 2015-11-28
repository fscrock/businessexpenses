require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "active_model/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Businessapp
  class Application < Rails::Application
    config.generators{|g| g.orm :mongo_mapper}
    config.active_record.raise_in_transactional_callbacks = true
  end
end
