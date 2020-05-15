require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:confirmed_user) { create(:confirmed_user) }

  it "is valid with default valid attributes" do
    expect(user).to be_valid
  end

  it { should have_one(:api_manager) }

  describe "email validations" do
    it { should validate_presence_of(:email) }

    it "should respond to email" do
      expect(user).to respond_to(:email)
    end

    it "is invalid with a blank or no email" do
      user.email = " "
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    
    it "is invalid without a proper email" do
      user.email = "a"
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end
    
    it "is invalid with a duplicate email" do
      user.save
      @otheruser = FactoryBot.build(:user, email: user.email)
      @otheruser.valid?
      expect(@otheruser.errors[:email]).to include("has already been taken")
    end
  end

  describe "password validations" do
    it { should validate_presence_of(:password) }

    it "should respond to password" do
      expect(user).to respond_to(:password)
    end
    
    it "should respond to password_confirmation" do
      expect(user).to respond_to(:password_confirmation)
    end

    it "is invalid without same password for password_confirmation" do
      user.password_confirmation = "xxxxx"
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    
    it "is invalid with password length < 8" do
      user.password = "123456"
      user.password_confirmation = "123456"
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
    
    it "is invalid with password length > 80" do
      user.password = Faker::Lorem.characters(number: 81)
      user.password_confirmation = user.password
      user.valid?
      expect(user.errors[:password][0]).to include("is too long")
    end

    it "should have encrypted password + not eq to password" do
      expect(user.password).not_to eq user.encrypted_password
    end
  end

  describe "username validations" do
    it { should validate_presence_of(:username) }

    it { should validate_uniqueness_of(:username) }

    it "should respond to username" do
      expect(user).to respond_to(:username)
    end

    it "is invalid with a blank username" do
      user.username = " "
      user.valid?
      expect(user.errors[:username]).to include("can't be blank")
    end

    it "is invalid with no username" do
      user.username = nil
      user.valid?
      expect(user.errors[:username]).to include("can't be blank")
    end

    it "is invalid with a duplicate username" do
      user.save
      @otheruser = FactoryBot.build(:user, username: user.username)
      @otheruser.valid?
      expect(@otheruser.errors[:username]).to include("has already been taken")
    end

    it "is invalid if length is < 1" do
      user.username = ""
      user.valid?
      expect(user.errors[:username]).to include("is too short (minimum is 1 character)")
    end

    it "is invalid if length is > 39" do
      user.username = Faker::Lorem.characters(number: 40)
      user.valid?
      expect(user.errors[:username]).to include("is too long (maximum is 39 characters)")
    end

    it "downcases username" do
      user.username = "ABCdeF"
      user.save
      expect(user.username).to eq "abcdef"
    end

    it "is invalid for bad username" do
      user.username = "ABC_E."
      user.valid?
      expect(user.errors[:username]).to include("is invalid")
    end
  end

  describe "first_name validations" do
    it { should validate_presence_of(:first_name) }

    it "should respond to first_name" do
      expect(user).to respond_to(:first_name)
    end

    it "is invalid with a blank first_name" do
      user.first_name = " "
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid with no first_name" do
      user.first_name = nil
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid if length is < 3" do
      user.first_name = "ab"
      user.valid?
      expect(user.errors[:first_name]).to include("is too short (minimum is 3 characters)")
    end

    it "is invalid if length is > 30" do
      user.first_name = Faker::Lorem.characters(number: 40)
      user.valid?
      expect(user.errors[:first_name]).to include("is too long (maximum is 30 characters)")
    end
  end

  describe "last_name validations" do
    it { should validate_presence_of(:last_name) }

    it "should respond to last_name" do
      expect(user).to respond_to(:last_name)
    end

    it "is invalid with a blank last_name" do
      user.last_name = " "
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid with no last_name" do
      user.last_name = nil
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid if length is < 3" do
      user.last_name = "ab"
      user.valid?
      expect(user.errors[:last_name]).to include("is too short (minimum is 3 characters)")
    end

    it "is invalid if length is > 30" do
      user.last_name = Faker::Lorem.characters(number: 40)
      user.valid?
      expect(user.errors[:last_name]).to include("is too long (maximum is 30 characters)")
    end
  end

  context "admin validations" do
    it "should respond to admin" do
      expect(user).to respond_to(:admin)
    end

    it "is invalid with no admin" do
      user.admin = nil
      user.valid?
      expect(user.errors[:admin]).to include("is not included in the list")
    end
  end

  context "confirmation attributes" do
    it "user is unconfimred" do
      expect(user.confirmed_at).to eq nil
    end

    it "should be a confirmed user" do
      expect(confirmed_user.confirmed_at).not_to eq nil
    end
  end

  context "Omniauth validations" do
    it "should respond to provider" do
      expect(user).to respond_to(:provider)
    end

    it "should respond to uid" do
      expect(user).to respond_to(:uid)
    end
  end

  context "2FA validations" do
    it "should respond to otp_secret_key" do
      expect(user).to respond_to(:otp_secret_key)
    end

    it "should respond to otp_module" do
      expect(user).to respond_to(:otp_module)
    end
  end
end
