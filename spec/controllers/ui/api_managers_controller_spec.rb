require 'rails_helper'

RSpec.describe Ui::ApiManagersController, type: :controller do
  let(:user) { create(:confirmed_user) }
  let(:api_manager) { create(:api_manager, scopes: ["Quote"], api_counts: [0], user_id: user.id) }

  describe "GET #new_request" do
    context "successful new_request" do
      context "when user requests API secret for first time for Quote" do
        before(:each) do
          sign_in user
          @current_api_scope = "Quote"
        end

        it "creates new API Manager" do
          expect { get :new_request, params: { scope: @current_api_scope } }.to change(ApiManager, :count).by(1)
        end

        it "redirects to dashboard_path" do
          get :new_request, params: { scope: @current_api_scope }
          expect(response).to redirect_to dashboard_path
        end

        it "shows Successfully enabled message" do
          get :new_request, params: { scope: @current_api_scope }
          expect(flash[:notice]).to eq Message.success_enable_api_scope(@current_api_scope)
        end
      end

      context "when user requests for another valid scope for API" do
        before(:each) do
          @user2 = create(:confirmed_user)
          sign_in @user2
          @api_manager2 = create(:api_manager, scopes: ["Quote"], api_counts: [0], user_id: @user2.id)
          @current_api_scope = "APIABC"
          allow(ApiManager).to receive(:valid_scopes_array) { ["Quote", @current_api_scope] }
          get :new_request, params: { scope: @current_api_scope }
        end

        it "redirects to dashboard_path" do
          expect(response).to redirect_to dashboard_path
        end

        it "shows Successfully enabled message" do
          expect(flash[:notice]).to eq Message.success_enable_api_scope(@current_api_scope)
        end
      end
    end

    context "unsuccessful new_request" do
      context "when user requests API secret with no/nil/empty scope param" do
        before(:each) do
          sign_in user
          @current_api_scope = ""
          get :new_request, params: { scope: @current_api_scope }
        end

        it "redirects to dashboard_path" do
          expect(response).to redirect_to dashboard_path
        end

        it "shows exception_missing_scope_param message" do
          expect(flash[:alert]).to eq Message.exception_missing_scope_param
        end
      end

      context "when user requests API secret for wrong scope param" do
        before(:each) do
          sign_in user
          @current_api_scope = "abcd"
          get :new_request, params: { scope: @current_api_scope }
        end

        it "redirects to dashboard_path" do
          expect(response).to redirect_to dashboard_path
        end

        it "shows error_wrong_scope_param message" do
          expect(flash[:alert]).to eq Message.error_wrong_scope_param(@current_api_scope)
        end
      end

      context "when user requests API secret for scope that is already enabled" do
        before(:each) do
          sign_in user
          @api_manager2 = create(:api_manager, scopes: ["Quote"], api_counts: [0], user_id: user.id)
          @current_api_scope = "Quote"
          get :new_request, params: { scope: @current_api_scope }
        end

        it "redirects to dashboard_path" do
          expect(response).to redirect_to dashboard_path
        end

        it "shows error_already_enabled_scope message" do
          expect(flash[:alert]).to eq Message.error_already_enabled_scope(@current_api_scope)
        end
      end
    end
  end
end
