require 'rails_helper'

RSpec.describe Api::V1::NewsletterController, type: :request do
  let(:api_v_newsletter_headers) { api_valid_headers }
  
  describe 'POST #newsletter_subscribe' do
    context "when request is valid and email is added" do
      before(:each) do
        newsletter_v_info = {
          "newsletter": {
            "firstName": "ABCDE",
            "email": "a@b.com"
          }
        }
        post api_newsletter_subscribe_path, params: newsletter_v_info.to_json, headers: api_v_newsletter_headers
      end

      it "returns success subscribed message" do
        expect(json['data']['message']).to eq Message.newsletter_email_subscribed
      end

      it_behaves_like "returns 200 success status"
    end

    context "when request is invalid" do
      context "when email is incorrect" do
        before(:each) do
          newsletter_inv_info = {
            "newsletter": {
              "firstName": "ABCDE",
              "email": "a@"
            }
          }
          post api_newsletter_subscribe_path, params: newsletter_inv_info.to_json, headers: api_v_newsletter_headers
        end

        it "returns invalid subscriber info error message" do
          expect(json['errors']['message']).to eq Message.newsletter_invalid_subscriber_info
        end

        it_behaves_like "returns 422 unprocessable entity status"
      end

      context "when firstName is incorrect" do
        before(:each) do
          newsletter_inv_info = {
            "newsletter": {
              "firstName": "A",
              "email": "a@b.com"
            }
          }
          post api_newsletter_subscribe_path, params: newsletter_inv_info.to_json, headers: api_v_newsletter_headers
        end

        it "returns invalid subscriber info error message" do
          expect(json['errors']['message']).to eq Message.newsletter_invalid_subscriber_info
        end

        it_behaves_like "returns 422 unprocessable entity status"
      end

      context "when empty/nil request is made" do
        before(:each) do
          newsletter_inv_info = {
            "newsletter": {
              "firstName": "",
              "email": ""
            }
          }
          post api_newsletter_subscribe_path, params: newsletter_inv_info.to_json, headers: api_v_newsletter_headers
        end

        it "returns invalid subscriber info error message" do
          expect(json['errors']['message']).to eq Message.newsletter_invalid_subscriber_info
        end

        it_behaves_like "returns 422 unprocessable entity status"
      end

      context "when error in server side API request or other errors" do
        before(:each) do
          ENV["sendgrid_auth_token"] = "invalid_test_token"
          newsletter_v_info = {
            "newsletter": {
              "firstName": "ABCDE",
              "email": "a@b.com"
            }
          }
          post api_newsletter_subscribe_path, params: newsletter_v_info.to_json, headers: api_v_newsletter_headers
        end

        after(:each) do
          ENV["sendgrid_auth_token"] = "test_token"
        end
  
        it "returns invalid subscriber info error message" do
          expect(json['errors']['message']).to eq Message.newsletter_api_error
        end

        it_behaves_like "returns 422 unprocessable entity status"
      end
    end
  end
end
