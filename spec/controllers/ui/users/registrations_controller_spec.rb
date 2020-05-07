require 'rails_helper'

RSpec.describe Ui::Users::RegistrationsController, type: :controller do
  let(:user) { create(:confirmed_user) }
  let(:github_user) { create(:github_omniauth_user) }

  describe "PATCH #update" do
    context "when normal user updates the profile" do
      before(:each) do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        sign_in user
        post :update, params: { id: user.id, user: { first_name: "Hello", current_password: "12345678" } }
      end

      it "redirects to dashboard_path" do
        expect(response).to redirect_to dashboard_path
      end

      it "shows successfully updated message" do
        expect(flash[:notice]).to eq "Your account has been updated successfully."
      end
    end

    context "when Omniauth user updates the profile" do
      before(:each) do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        sign_in github_user
        post :update, params: { id: user.id, user: { first_name: "Hello" } }
      end

      it "redirects to dashboard_path" do
        expect(response).to redirect_to dashboard_path
      end

      it "shows successfully updated message" do
        expect(flash[:notice]).to eq "Your account has been updated successfully."
      end
    end
  end
end
