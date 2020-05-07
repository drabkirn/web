require 'rails_helper'

RSpec.describe Ui::Users::OmniauthCallbacksController, type: :controller do
  describe "POST #github" do
    context "when user signs in successfully with github" do
      before(:each) do
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
          provider: 'github',
          uid: '123545',
          info: {
            email: Faker::Internet.email,
            nickname: Faker::Internet.username(specifier: 3..10, separators: %w(_))
          }
        })
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
        get :github
      end

      after(:each) do
        OmniAuth.config.test_mode = false
      end

      it "creates user and redirects to dashboard_path" do
        expect(response).to redirect_to dashboard_path
      end

      it "shows successfull sign in with GitHub message" do
        expect(flash[:notice]).to eq "Successfully authenticated from Github account."
      end
    end

    context "when user cannot sign in with GitHub" do
      before(:each) do
        @user1 = create(:confirmed_user)
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
          provider: 'github',
          uid: '123545',
          info: {
            email: @user1.email,
            nickname: Faker::Internet.username(specifier: 3..10, separators: %w(_))
          }
        })
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
        get :github
      end

      after(:each) do
        OmniAuth.config.test_mode = false
      end

      it "creates user and redirects to new_user_registration_path" do
        expect(response).to redirect_to new_user_registration_path
      end

      it "shows omniauth login error message" do
        expect(flash[:alert]).to eq Message.omniauth_login_error
      end
    end
  end

  describe "POST #google_oauth2" do
    context "when user signs in successfully with google_oauth2" do
      before(:each) do
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
          provider: 'google_oauth2',
          uid: '123545',
          extra: {
            id_info: {
              email: Faker::Internet.email,
              given_name: Faker::Lorem.characters(number: 10).capitalize,
              family_name: Faker::Lorem.characters(number: 10).capitalize
            }
          }
        })
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
        get :google_oauth2
      end

      after(:each) do
        OmniAuth.config.test_mode = false
      end

      it "creates user and redirects to dashboard_path" do
        expect(response).to redirect_to dashboard_path
      end

      it "shows successfull sign in with google_oauth2 message" do
        expect(flash[:notice]).to eq "Successfully authenticated from Google account."
      end
    end

    context "when user signs in successfully with google_oauth2 with no name" do
      before(:each) do
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
          provider: 'google_oauth2',
          uid: '123545',
          extra: {
            id_info: {
              email: Faker::Internet.email
            }
          }
        })
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
        get :google_oauth2
      end

      after(:each) do
        OmniAuth.config.test_mode = false
      end

      it "creates user and redirects to dashboard_path" do
        expect(response).to redirect_to dashboard_path
      end

      it "current user name defaults to Anonymous Dragon" do
        expect(controller.current_user.first_name).to eq "Anonymous"
        expect(controller.current_user.last_name).to eq "Dragon"
      end

      it "shows successfull sign in with google_oauth2 message" do
        expect(flash[:notice]).to eq "Successfully authenticated from Google account."
      end
    end

    context "when user cannot sign in with google_oauth2" do
      before(:each) do
        @user1 = create(:confirmed_user)
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
          provider: 'google_oauth2',
          uid: '123545',
          extra: {
            id_info: {
              email: @user1.email,
              given_name: Faker::Lorem.characters(number: 10).capitalize,
              family_name: Faker::Lorem.characters(number: 10).capitalize
            }
          }
        })
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
        get :google_oauth2
      end

      after(:each) do
        OmniAuth.config.test_mode = false
      end

      it "creates user and redirects to new_user_registration_path" do
        expect(response).to redirect_to new_user_registration_path
      end

      it "shows omniauth login error message" do
        expect(flash[:alert]).to eq Message.omniauth_login_error
      end
    end
  end

  describe "POST #twitter" do
    context "when user signs in successfully with twitter" do
      before(:each) do
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
          provider: 'twitter',
          uid: '123545',
          info: {
            email: Faker::Internet.email,
            nickname: Faker::Internet.username(specifier: 3..10, separators: %w(_)),
            name: "Hello World"
          }
        })
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
        get :twitter
      end

      after(:each) do
        OmniAuth.config.test_mode = false
      end

      it "creates user and redirects to dashboard_path" do
        expect(response).to redirect_to dashboard_path
      end

      it "shows successfull sign in with Twitter message" do
        expect(flash[:notice]).to eq "Successfully authenticated from Twitter account."
      end
    end

    context "when user signs in successfully with twitter with no name" do
      before(:each) do
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
          provider: 'twitter',
          uid: '123545',
          info: {
            email: Faker::Internet.email,
            nickname: Faker::Internet.username(specifier: 3..10, separators: %w(_)),
            name: "A"
          }
        })
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
        get :twitter
      end

      after(:each) do
        OmniAuth.config.test_mode = false
      end

      it "creates user and redirects to dashboard_path" do
        expect(response).to redirect_to dashboard_path
      end

      it "current user name defaults to Anonymous Dragon" do
        expect(controller.current_user.first_name).to eq "Anonymous"
        expect(controller.current_user.last_name).to eq "Dragon"
      end

      it "shows successfull sign in with Twitter message" do
        expect(flash[:notice]).to eq "Successfully authenticated from Twitter account."
      end
    end

    context "when user cannot sign in with Twitter" do
      before(:each) do
        @user1 = create(:confirmed_user)
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
          provider: 'twitter',
          uid: '123545',
          info: {
            email: @user1.email,
            nickname: Faker::Internet.username(specifier: 3..10, separators: %w(_)),
            name: "Hello World"
          }
        })
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
        get :twitter
      end

      after(:each) do
        OmniAuth.config.test_mode = false
      end

      it "creates user and redirects to new_user_registration_path" do
        expect(response).to redirect_to new_user_registration_path
      end

      it "shows omniauth login error message" do
        expect(flash[:alert]).to eq Message.omniauth_login_error
      end
    end
  end
end
