require 'exception_notification/rails'

ExceptionNotification.configure do |config|
  # Ignore additional exception types.
  # ActiveRecord::RecordNotFound, Mongoid::Errors::DocumentNotFound, AbstractController::ActionNotFound and ActionController::RoutingError are already added.
  # config.ignored_exceptions += %w{ActionView::TemplateError CustomError}

  # Adds a condition to decide when an exception must be ignored or not.
  # The ignore_if method can be invoked multiple times to add extra conditions.
  config.ignore_if do |exception, options|
    Rails.env.test?
  end

  # Ignore exceptions generated by crawlers
  # config.ignore_crawlers %w{Googlebot bingbot}

  # Email notifier sends notifications by email.
  # config.add_notifier :email, {
  #   email_prefix: '[ERROR] ',
  #   sender_address: %{"DBK Web Exception" <exception@cdadityang.xyz>},
  #   exception_recipients: %w{ drabkirn@cdadityang.xyz }
  # }

  # Slack Notification
  # config.add_notifier :slack, {
  #   webhook_url: ENV["slack_exception_webhook"],
  #   channel: '#exceptions'
  # }

  # Discord Notification
  ## Add /slack to default discord webhook
  config.add_notifier :slack, {
    webhook_url: ENV["discord_exception_webhook"]
  }

  # TODO: Grouping
  # config.error_grouping = true
  # config.error_grouping_period = 20.seconds
  # config.notification_trigger = lambda { |exception, count| count % 3 == 0 }
end
