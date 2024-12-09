class User < ApplicationRecord
  validates :provider, presence: true
  validates :uid, presence: true
  validates :email, uniqueness: { allow_nil: true }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Please enter a valid email address" }, allow_blank: true

  def self.find_or_create_from_auth_hash(auth_hash)
    find_or_create_by!(provider: auth_hash['provider'], uid: auth_hash['uid']) do |u|
      u.email = auth_hash['info']['email']
    end
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error("Error creating user: #{e.message}")
    nil
  rescue => e
    Rails.logger.error("Unexpected error: #{e.message}")
    nil
  end
end
