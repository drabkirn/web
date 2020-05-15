class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers: [:github, :google_oauth2, :twitter]

  # OTP Token
  has_one_time_password
  enum otp_module: { disabled: 0, enabled: 1 }, _prefix: true
  attr_accessor :otp_code_token

  # Api Manager
  has_one :api_manager

  # Username regex for custom validations
  USERNAME_REGEX = /\A[a-z0-9\_]+\z/i

  # Other validations
  validates :username, uniqueness: { case_sensitive: true }, presence: true, length: { minimum: 1, maximum: 39 }, format: { with: USERNAME_REGEX, multiline: true }
  validates :first_name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 30 }
  validates_inclusion_of :admin, in: [true, false]

  before_save :downcase_username

  ## Strategy for users coming from GitHub
  def self.from_github_omniauth(auth)
    return where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.nickname[0...39]
      user.first_name = "Anonymous"
      user.last_name = "Dragon"
      user.skip_confirmation!
    end
  end

  ## Strategy for users coming from Google
  def self.from_google_outh2_omniauth(auth)
    return where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.extra.id_info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = user.email.split("@").first.gsub(".", "_")[0...39]
      
      if auth.extra.id_info.given_name && auth.extra.id_info.given_name.length > 3
        user.first_name = auth.extra.id_info.given_name[0...30]
      else
        user.first_name = "Anonymous"
      end
      if auth.extra.id_info.family_name && auth.extra.id_info.family_name.length > 3
        user.last_name = auth.extra.id_info.family_name[0...30]
      else
        user.last_name = "Dragon"
      end
      user.skip_confirmation!
    end
  end

  ## Strategy for users coming from Twitter
  def self.from_twitter_omniauth(auth)
    return where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.nickname[0...39]
      if auth.info.name.split(" ").first && (auth.info.name.split(" ").first.length > 3 && auth.info.name.split(" ").first.length < 30)
        user.first_name = auth.info.name.split(" ").first
      else
        user.first_name = "Anonymous"
      end
      if auth.info.name.split(" ")[1] && (auth.info.name.split(" ")[1].length > 3 && auth.info.name.split(" ")[1].length < 30)
        user.last_name = auth.info.name.split(" ")[1]
      else
        user.last_name = "Dragon"
      end
      user.skip_confirmation!
    end
  end

  private
    ## Downcase the username before saving, ensures integrity.
    def downcase_username
      self.username = self.username.downcase if self.username
    end
end
