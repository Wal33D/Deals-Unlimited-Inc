Rails.application.configure do

  config.cache_classes = true
  config.action_controller.action_on_unpermitted_parameters =:log
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :user_name            => 'aquataze91@gmail.com',
    :password             => 'vtcfuumyokxhdhzu',
    :authentication       => 'plain',
    :enable_starttls_auto => true
}
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.digest = true
  config.assets.raise_runtime_errors = true
end

