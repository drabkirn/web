require 'rails_helper'

RSpec.describe Ui::LegalController, type: :controller do
  describe "GET #privacy_policy" do
    before(:each) do
      get :privacy_policy
    end

    it "returns 200 success status from response" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #terms_conditions" do
    before(:each) do
      get :terms_conditions
    end

    it "returns 200 success status from response" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #credits" do
    before(:each) do
      get :credits
    end

    it "returns 200 success status from response" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #cla" do
    before(:each) do
      get :cla
    end

    it "returns 200 success status from response" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #analytics_opt_out" do
    before(:each) do
      get :analytics_opt_out
    end

    it "returns 200 success status from response" do
      expect(response).to have_http_status(200)
    end
  end
end
