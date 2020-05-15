require 'rails_helper'

RSpec.describe Api::V1::QuotesController, type: :request do
  let(:quote) { create(:quote) }
  let(:user) { create(:confirmed_user) }
  let(:api_manager) { create(:api_manager, scopes: ["Quote"], api_counts: [0], user_id: user.id) }

  let(:api_v_headers) { api_valid_quotes_headers(api_manager.secret) }

  let(:api_inv_headers_no_quotes_token) { api_valid_headers }

  let(:api_inv_headers_wrong_quotes_token) {
    {
      "Content-Type": "application/json",
      "Accept": "application/drabkirn.web.v1",
      "QuotesToken": "abcd"
    }
  }

  describe 'GET #index' do
    context "when request is valid" do
      before(:each) do
        3.times { create(:quote) }
        get api_quotes_path, params: {}, headers: api_v_headers
      end

      it "returns 3 quotes" do
        expect(json['data'].length).to eq 3
      end

      it "returns success loaded message" do
        expect(json['message']).to eq Message.quotes_index_loaded
      end

      it "increases quotes api count by 1" do
        api_manager.reload
        expect(api_manager.api_counts[0]).to eq 1
      end

      it_behaves_like "returns 200 success status"
    end

    context "when request is invalid" do
      context "when quotes token header is not present" do
        before(:each) do
          3.times { create(:quote) }
          get api_quotes_path, params: {}, headers: api_inv_headers_no_quotes_token
        end
  
        it "exception_missing_quotes_token_header message" do
          expect(json['errors']['message']).to eq Message.exception_missing_quotes_token_header
        end

        it_behaves_like "returns 401 unauthorized status"
      end

      context "when quotes token header is wrong" do
        before(:each) do
          3.times { create(:quote) }
          get api_quotes_path, params: {}, headers: api_inv_headers_wrong_quotes_token
        end
  
        it "unauthorized_for_scope message" do
          expect(json['errors']['message']).to eq Message.unauthorized_for_scope("Quote")
        end

        it_behaves_like "returns 401 unauthorized status"
      end

      context "when user has no scope assigned to make request" do
        before(:each) do
          3.times { create(:quote) }
          allow(ApiManager).to receive(:valid_scopes_array) { ["Quote", "ABC"] }
          @user2 = create(:confirmed_user) 
          @api_manager2 = create(:api_manager, scopes: ["ABC"], api_counts: [0], user_id: @user2.id)
          @new_headers = {
            "Content-Type": "application/json",
            "Accept": "application/drabkirn.web.v1",
            "QuotesToken": @api_manager2.secret
          }
          get api_quotes_path, params: {}, headers: @new_headers
        end
  
        it "unauthorized_for_scope message" do
          expect(json['errors']['message']).to eq Message.unauthorized_for_scope("Quote")
        end

        it_behaves_like "returns 401 unauthorized status"
      end
    end
  end


  describe 'GET #show' do
    context "when request is valid" do
      before(:each) do
        get api_quote_path(quote.id), params: {}, headers: api_v_headers
      end
  
      it "returns the requested id of the quote" do
        expect(json['data']['id']).to eq quote.id
      end
  
      it "returns success loaded message" do
        expect(json['message']).to eq Message.quote_show_loaded(quote.id)
      end
  
      it "returns the requested title of the quote" do
        expect(json['data']['title']).to eq quote.title
      end
  
      it_behaves_like "returns 200 success status"
    end

    context "when request is invalid" do
      context "when quotes token header is not present" do
        before(:each) do
          get api_quote_path(quote.id), params: {}, headers: api_inv_headers_no_quotes_token
        end
  
        it "exception_missing_quotes_token_header message" do
          expect(json['errors']['message']).to eq Message.exception_missing_quotes_token_header
        end

        it_behaves_like "returns 401 unauthorized status"
      end

      context "when quotes token header is wrong" do
        before(:each) do
          get api_quote_path(quote.id), params: {}, headers: api_inv_headers_wrong_quotes_token
        end
  
        it "unauthorized_for_scope message" do
          expect(json['errors']['message']).to eq Message.unauthorized_for_scope("Quote")
        end

        it_behaves_like "returns 401 unauthorized status"
      end

      context "when user has no scope assigned to make request" do
        before(:each) do
          3.times { create(:quote) }
          allow(ApiManager).to receive(:valid_scopes_array) { ["Quote", "ABC"] }
          @user2 = create(:confirmed_user) 
          @api_manager2 = create(:api_manager, scopes: ["ABC"], api_counts: [0], user_id: @user2.id)
          @new_headers = {
            "Content-Type": "application/json",
            "Accept": "application/drabkirn.web.v1",
            "QuotesToken": @api_manager2.secret
          }
          get api_quote_path(quote.id), params: {}, headers: @new_headers
        end
  
        it "unauthorized_for_scope message" do
          expect(json['errors']['message']).to eq Message.unauthorized_for_scope("Quote")
        end

        it_behaves_like "returns 401 unauthorized status"
      end
    end
  end
end
