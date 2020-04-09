require 'rails_helper'

RSpec.describe Ui::DocsController, type: :controller do

  describe "GET #index" do
    before(:each) do
      get :index
    end

    it "returns 200 success status from response" do
      expect(response).to have_http_status(200)
    end
  end

end
