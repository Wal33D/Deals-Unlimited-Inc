require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(*Rails.groups)
Bundler.require(:default, Rails.env)
module DealsUnlimitedInc
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
  end
end
