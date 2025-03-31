class SessionsController < ApplicationController
  skip_before_action :require_login, only: :create

  def create
    auth_hash = request.env["omniauth.auth"]
    begin
      user = User.find_or_create_from_auth_hash(auth_hash)
      if user
        session[:user_id] = user.id
        redirect_to session.delete(:return_to) || root_path, notice: "Logged in successfully!"
      else
        redirect_to root_path, alert: "Login failed: Unable to find or create user. Please check your Google account settings."
      end
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error("Login failed (RecordInvalid): #{e.message} - #{e.record.errors.full_messages.join(', ')}")
      redirect_to root_path, alert: "Login failed: Invalid user data. Please contact support."
    rescue => e
      Rails.logger.error("Login failed (Unexpected Error): #{e.message} - #{e.backtrace.join("\n")}")
      redirect_to root_path, alert: "Login failed. Please try again later or contact support."
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Logged out!"
  end
end
