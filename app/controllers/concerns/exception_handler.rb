# Handling custom Exceptions that Rails app throws
module ExceptionHandler
  extend ActiveSupport::Concern
  
  # Define custom error subclasses - rescue catches `StandardErrors`
  class InternalServerError < StandardError; end
  class UnprocessableEntityError < StandardError; end
  class UnauthorizedRequestError < StandardError; end
  class ConsumerError < StandardError
    def initialize(record, request_env, custom_notify = true)
      @record = record
      @request_env = request_env
      @custom_notify = custom_notify
    end

    def record
      @record
    end

    def request_env
      @request_env
    end

    def custom_notify
      @custom_notify
    end
  end

  included do
    # Define custom handlers
    ## For Invalid record and Routing error - 404
    rescue_from ActiveRecord::RecordInvalid, with: :four_not_four
    rescue_from ActionController::RoutingError, with: :four_not_four

    ## For Internal Server ever - 500
    rescue_from ExceptionHandler::InternalServerError, with: :five_zero_zero

    ## For Unprocessable Entity error - 422
    rescue_from ExceptionHandler::UnprocessableEntityError, with: :unprocessable_entity_request

    ## For others auth request - 401 - Unauthorized
    rescue_from ExceptionHandler::UnauthorizedRequestError, with: :unauthorized_request

    ## When there is exception in rails or react
    rescue_from ExceptionHandler::ConsumerError, with: :send_expection_notification
  end

  private

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_request(e)
    send_response = {
      status: 401,
      errors: {
        message: e.message
      }
    }
    json_response(send_response, :unauthorized)
  end

  # JSON response with message; Status code 404 - not found
  def four_not_four(e)
    send_response = {
      status: 404,
      errors: {
        message: e.message
      }
    }
    json_response(send_response, :not_found)
  end

  # JSON response with message; Status code 422 - Unprocessable Entity
  def unprocessable_entity_request(e)
    send_response = {
      status: 422,
      errors: {
        message: e.message
      }
    }
    json_response(send_response, :unprocessable_entity)
  end

  # JSON response with message; Status code 500 - internal server error
  def five_zero_zero(e)
    send_response = {
      status: 500,
      errors: {
        message: e.message
      }
    }
    json_response(send_response, :internal_server_error)
  end

  # When there is a consumer exception, send notification
  def send_expection_notification(e)
    ExceptionNotifier.notify_exception(e, env: e.request_env, data: { id: e.record.id, message: e.record.title })

    unprocessable_entity_request(ExceptionHandler::UnprocessableEntityError.new(Message.feerror_reported_api_error)) unless e.record.id
  end
end