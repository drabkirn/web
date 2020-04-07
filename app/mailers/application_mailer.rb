class ApplicationMailer < ActionMailer::Base
  default from: ENV["mailer_default_email_address"]
  layout 'mailer'
end
