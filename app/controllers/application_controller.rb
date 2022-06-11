# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user

  # TODO: Use Devise to manage user accounts
  def authenticate_user
    return if user_id

    @user_id = cookies[:user_id] = SecureRandom.uuid
  end

  def user_id
    @user_id ||= cookies[:user_id]
  end
end
