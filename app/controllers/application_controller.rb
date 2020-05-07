class ApplicationController < ActionController::Base

  # Include our concerns helpers
  include Response
  include ExceptionHandler

  # For API requests, our custom Accept header must be present
  before_action :accept_header_check_for_api_requests

  # For devise controllers, manage permitted parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

  # When making invalid API-only requests, raise 404
  def action_not_found
    raise(ActionController::RoutingError, Message.action_not_found)
  end

  # When something is wrong in the app/server - API-only, raise 500
  def internal_server_error
    raise(ExceptionHandler::InternalServerError, Message.exception_internal_server_error)
  end

  protected
    ## Devise whitelist params for users signup and updates
    def configure_permitted_parameters
      sign_up_added_attrs = [:first_name, :last_name, :username, :email, :password, :password_confirmation, :remember_me]
      update_added_attrs = [:first_name, :last_name, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: sign_up_added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: update_added_attrs
    end

    ## Devise - after sign_in, goto /dashboard
    def after_sign_in_path_for(resource)
      dashboard_path
    end

    ## Devise - after sign out, goto /users/sign_in
    def after_sign_out_path_for(resource)
      new_user_session_path
    end

  private
    ## First check if the request is API or UI
    ## If API request, then validate if it's our custom or else throw error.
    def accept_header_check_for_api_requests
      is_api_request = ApiRequestCheck.new.matches?(request)
      if is_api_request
        accept_header = request.headers["Accept"]
        accept_version = "v1"
        required_header_content = "application/drabkirn.web.#{accept_version}"
        if accept_header.present?
          raise(ExceptionHandler::WrongAcceptHeader, Message.exception_wrong_accept_header) if accept_header != required_header_content
        else
          raise(ExceptionHandler::MissingAcceptHeader, Message.exception_missing_accept_header)
        end
      end
    end
end
