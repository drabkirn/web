class Api::V1::QuotesController < ApplicationController
  ## Quotes token header must be present and valid to get access to Quotes
  before_action :require_quotes_token_header
  before_action :validate_quotes_token_header

  # API: GET /quotes
  def index
    @quotes = Quote.all
    send_response = {
      status: 200,
      message: Message.quotes_index_loaded,
      data: @quotes
    }
    json_response(send_response)
  end

  # API: GET /quotes/:id
  def show
    @quote_id = params[:id]
    @quote = Quote.find(@quote_id)
    send_response = {
      status: 200,
      message: Message.quote_show_loaded(@quote_id),
      data: @quote
    }
    json_response(send_response)
  end

  private
    ## For every request made to Quotes :show, :index
    ## Check whether QuotesToken header is present or not
    def require_quotes_token_header
      quotes_token_header = request.headers['QuotesToken'] ? request.headers['QuotesToken'] : nil
      if !quotes_token_header
        raise ExceptionHandler::UnauthorizedRequestError, Message.exception_missing_quotes_token_header
        return
      end
    end

    ## Now validate the QuotesToken, see if it is has current permission for API Access
    def validate_quotes_token_header
      current_api_scope = "Quote"
      quotes_token_header = request.headers['QuotesToken']
      api_data = ApiManager.validate_scope_secret(current_api_scope, quotes_token_header)
      if !api_data
        raise ExceptionHandler::UnauthorizedRequestError, Message.unauthorized_for_scope(current_api_scope)
        return
      end
      update_api_data(current_api_scope, api_data)
    end

    ## Everything is right, now update the DB
    def update_api_data(scope, api_data)
      scope_index = api_data.scopes.find_index(scope)
      api_data.api_counts[scope_index] += 1
      api_data.save
    end
end
