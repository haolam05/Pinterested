require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?
  config.assets.compile = false
  config.active_storage.service = :local
  config.log_level = :info
  config.log_tags = [ :request_id ]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.report_deprecations = false
  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false

  # Added as devise installation instruction --- ACTUAL HOST, URL to get to website in production
  config.action_mailer.default_url_options = { host: 'railspinterest555.herokuapp.com' }

  # stores image on amazon s3
  config.active_storage.service = :amazon

  # smtp confirmation email and forgot password set up
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.smtp_settings = {
    :address => Rails.application.credentials.config[:gmail][:address],
    :port => 587,
    :domain => Rails.application.credentials.config[:gmail][:domain],
    :user_name => Rails.application.credentials.config[:gmail][:email],
    :password => Rails.application.credentials.config[:gmail][:app_password],
    :authentication => 'plain',
    :enable_starttls_auto => true
  } 
end
