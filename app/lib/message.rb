# Helper class for all custom messages used through the app
class Message
  # API Messages
  def self.exception_wrong_accept_header
    "Exception: You've included wrong Accept header in your request"
  end

  def self.exception_missing_accept_header
    "Exception: You've not included a valid Accept header in your request"
  end

  def self.unauthorized_for_scope(scope)
    "Error: You're unauthorized for making this request for scope: #{scope}"
  end

  # Quotes messages
  def self.quotes_index_loaded
    "All Drabkirn Quotes loaded successfully"
  end

  def self.quote_show_loaded(id)
    "Drabkirn Quote with #{id} loaded successfully"
  end

  def self.exception_missing_quotes_token_header
    "Exception: You've not included a valid QuotesToken header in your request"
  end

  # API Manager messages
  def self.exception_missing_scope_param
    "Exception: Missing scope parameter from your request"
  end

  def self.error_wrong_scope_param(scope_param)
    "Error: You've entered a wrong scope param: #{scope_param}, this value is not accepted"
  end

  def self.error_already_enabled_scope(scope_param)
    "Error: You've already enabled this scope: #{scope_param}, see your secrets in your dashboard"
  end

  def self.success_enable_api_scope(scope_param)
    "You've successfully enabled the API for #{scope_param}, now you can start using the API"
  end

  # System messages
  def self.action_not_found(record = 'record')
    "Error: Requested #{record} not found"
  end

  def self.exception_internal_server_error
    "Exception: 500 Internal Server error. There is something wrong from our end, check back soon or contact us"
  end

  # Newsletter Messages
  def self.newsletter_email_subscribed
    "Your email is added to our newsletter successfully"
  end

  def self.newsletter_invalid_subscriber_info
    "Error: It looks like you've entered invalid email or name. Please try again with proper details"
  end

  def self.newsletter_api_error
    "Error: There is something wrong with your request, please try later or try alternative method."
  end

  # Users messages
  def self.omniauth_login_error
    "We couldn't login you in using Twitter. Maybe you've already signed up here or something else is wrong. Please try again and if the problem persists, contact us from the footer of this page."
  end

  # 2FA Messages
  def self.two_fa_empty
    "You've two factor enabled for your account, so you'll need to enter your token while signing in. If you've no access to your OTP, contact us from the footer of this page."
  end

  def self.two_fa_wrong
    "You've entered wrong 2FA code. Please try again and if the problem persists, contact us from the footer of this page."
  end
  
  def self.two_fa_enabled
    "Yayay! Two factor authentication has been successfully enabled for your account, now you'll need to input token to access your account. Your account is now more secure."
  end

  def self.two_fa_not_enabled
    "We're sorry, we couldn't enable two factor authentication to your account. Please try again and if the problem persists, contact us from the footer of this page."
  end

  def self.two_fa_disabled
    "Woooo! Two factor authentication has been successfully disabled for your account. This has now reduced your account security."
  end

  def self.two_fa_not_disabled
    "We're sorry, we couldn't disable two factor authentication to your account. Please try again and if the problem persists, contact us from the footer of this page."
  end

  def self.two_fa_for_non_omniauth_user(provider)
    "You are using #{provider} to access your account, so you don't need to enable 2FA here because #{provider} have built-in 2FA settings."
  end
end