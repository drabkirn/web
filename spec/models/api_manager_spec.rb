require 'rails_helper'

RSpec.describe ApiManager, type: :model do
  let(:api_manager) { build(:api_manager) }

  it "is valid with default valid attributes" do
    expect(api_manager).to be_valid
  end

  it { should belong_to(:user) }

  describe "secret validations" do
    it { should validate_presence_of(:secret) }

    context "uniqueness validation" do
      before(:each) do
        @user = FactoryBot.create(:confirmed_user)
        @api_manager = FactoryBot.create(:api_manager, user_id: @user.id)
      end

      it { should validate_uniqueness_of(:secret) }
    end

    it "should respond to secret" do
      expect(api_manager).to respond_to(:secret)
    end

    it "is invalid with a blank or no secret" do
      api_manager.secret = " "
      api_manager.valid?
      expect(api_manager.errors[:secret]).to include("can't be blank")
    end

    it "is invalid if length is != 60" do
      api_manager.secret = "abcd"
      api_manager.valid?
      expect(api_manager.errors[:secret]).to include("is the wrong length (should be 60 characters)")
    end
  end

  describe "scopes validations" do
    it { should validate_presence_of(:scopes) }

    it "is invalid without scopes" do
      api_manager.scopes = nil
      expect(api_manager).to_not be_valid
    end
    
    it "is invalid if scopes is empty" do
      api_manager.scopes = []
      expect(api_manager).to_not be_valid
    end
  end

  describe "api_counts validations" do
    it { should validate_presence_of(:api_counts) }

    it "is invalid without api_counts" do
      api_manager.api_counts = nil
      expect(api_manager).to_not be_valid
    end
    
    it "is invalid if api_counts is empty" do
      api_manager.api_counts = []
      expect(api_manager).to_not be_valid
    end
  end
end
