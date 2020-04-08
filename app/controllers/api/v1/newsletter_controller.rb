class Api::V1::NewsletterController < ApplicationController

  def subscribe
    subscriber_first_name = subscriber_params["firstName"]
    subscriber_email = subscriber_params["email"]

    if !(subscriber_validation(subscriber_first_name, subscriber_email))
      send_response = {
        status: 422,
        errors: {
          message: Message.newsletter_invalid_subscriber_info
        }
      }
      json_response(send_response, :unprocessable_entity)
      return
    end

    require 'uri'
    require 'net/http'
    require 'json'

    sendgrid_url = "https://api.sendgrid.com/v3/marketing/contacts";
    sendgrid_list_id = ENV["sendgrid_list_id"]

    # Make the request
    uri = URI(sendgrid_url)
    request = Net::HTTP::Put.new(uri.request_uri)

    ## Request headers
    request['Content-Type'] = 'application/json'
    request['Accept'] = 'application/json'
    request['User-Agent'] = 'Drabkirn : Web API : drabkirn@cdadityang.xyz'
    request['Authorization'] = "Bearer " + ENV["sendgrid_auth_token"]

    ## Request body
    myBody = {
      list_ids: [ sendgrid_list_id ],
      contacts: [
        {
          email: subscriber_email,
          first_name: subscriber_first_name
        }
      ]
    }.to_json

    request.body = myBody

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
    end

    response_code = JSON.parse(response.code)
    response_body = JSON.parse(response.body)

    if response_body["errors"]
      send_response = {
        status: 422,
        errors: {
          message: Message.newsletter_api_error
        }
      }
      json_response(send_response, :unprocessable_entity)
      return
    else
      send_response = {
        status: 200,
        message: Message.newsletter_email_subscribed,
        data: {
          message: Message.newsletter_email_subscribed
        }
      }
      json_response(send_response)
      return
    end
  end

  private
    def subscriber_params
      params.require(:newsletter).permit(:firstName, :email)
    end

    ## For validation of newsletter, server side
    def subscriber_validation(firstName, email)
      email_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
      if(firstName.nil? || firstName.empty? || email.nil? || email.empty? )
        return false
      elsif (firstName.length < 4 || firstName.length > 20)
        return false
      elsif !(email.match(email_regex))
        return false
      end
      return true
    end
end
