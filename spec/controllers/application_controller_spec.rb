require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  # Additional test for testing sign out path
  describe "after sign_out path test" do
    before(:each) do
      @user = create(:confirmed_user)
      sign_in @user
    end

    it 'redirects user to new_user_session_path' do    
      expect(controller.instance_eval { after_sign_out_path_for(@user) } ).to eq new_user_session_path
    end
  end
end
