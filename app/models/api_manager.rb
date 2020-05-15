class ApiManager < ApplicationRecord
  belongs_to :user

  ## scopes and api_counts are an array, so initialize them as array
  serialize :scopes
  serialize :api_counts
  after_initialize do |api_manager|
    ## Always, these scopes and respective API Counts should be in order
    ## ["Quote"]
    ## [0]
    api_manager.scopes = [] if api_manager.scopes == nil
    api_manager.api_counts = [] if api_manager.api_counts == nil
    api_manager.secret = SecureRandom.hex(30) unless api_manager.secret.present?
  end

  ## Self-explanatory validations
  validates :secret, presence: true, length: { is: 60 }, uniqueness: { case_sensitive: true }
  validates :scopes, presence: true, length: { minimum: 1 }
  validates :api_counts, presence: true, length: { minimum: 1 }

  def self.valid_scopes_array
    ["Quote"]
  end

  def self.validate_scope_secret(scope, secret)
    api_data = ApiManager.find_by(secret: secret)
    return false unless api_data.present?
    return false unless api_data.scopes.include?(scope)
    api_data
  end
end
