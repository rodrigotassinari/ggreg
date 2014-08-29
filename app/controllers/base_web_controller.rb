class BaseWebController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  private

  # before_action
  def require_initial_setup
    redirect_to signup_path and return unless User.any?
  end

end
