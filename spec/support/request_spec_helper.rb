module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end
  
  def api_valid_headers
    {
      "Content-Type": "application/json",
      "Accept": "application/drabkirn.web.v1"
    }
  end

  def api_valid_quotes_headers(quotes_secret)
    {
      "Content-Type": "application/json",
      "Accept": "application/drabkirn.web.v1",
      "QuotesToken": quotes_secret
    }
  end

  def ui_valid_headers
    {
      "Accept": "application/drabkirn.web.v1"
    }
  end

  def api_invalid_headers_with_empty_accept_header
    {
      "Content-Type": "application/json",
      "Accept": ""
    }
  end

  def api_invalid_headers_with_wrong_accept_header
    {
      "Content-Type": "application/json",
      "Accept": "application/drabkirn.web.v11"
    }
  end
end