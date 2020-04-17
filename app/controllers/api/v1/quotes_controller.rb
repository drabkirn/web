class Api::V1::QuotesController < ApplicationController

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
end
