class Ui::Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # When authenticating with GitHub
  def github
    @user = User.from_github_omniauth(auth_params)
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: "Github") if is_navigational_format?
    else
      session["devise.github_data"] = auth_params
      redirect_to new_user_registration_url, alert: Message.omniauth_login_error
    end
  end

  # When authenticating with Google
  def google_oauth2
    @user = User.from_google_outh2_omniauth(auth_params)
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
    else
      session["devise.google_oauth2_data"] = auth_params
      redirect_to new_user_registration_url, alert: Message.omniauth_login_error
    end
  end

  # When authenticating with Twitter
  def twitter
    @user = User.from_twitter_omniauth(auth_params)
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: "Twitter") if is_navigational_format?
    else
      session["devise.twitter_data"] = auth_params
      redirect_to new_user_registration_url, alert: Message.omniauth_login_error
    end
  end

  def failure
    redirect_to new_user_registration_url, alert: Message.omniauth_login_error
  end

  private

  def auth_params
    request.env["omniauth.auth"]
  end
end