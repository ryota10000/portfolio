class User < ApplicationRecord
  validates :provider, presence: true
  validates :uid, presence: true
  validates :email, uniqueness: { allow_nil: true }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Please enter a valid email address" }, allow_blank: true

  def self.find_or_create_from_auth_hash(auth_hash)
    user = find_or_initialize_by(provider: auth_hash['provider'], uid: auth_hash['uid'])
    user.email = auth_hash['info']['email']
    user.name = auth_hash['info']['name']
    user.save!
    user
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error("Error creating user: #{e.message}")
    nil
  rescue => e
    Rails.logger.error("Unexpected error: #{e.message}")
    nil
  end
end
