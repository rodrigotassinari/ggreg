class BaseWebController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  private

  # TODO spec
  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  # TODO spec
  def current_user
    @current_user ||= Session.authenticated_user(session)
  end
  helper_method :current_user

  # before_action
  # Requires the initial setup to be completed, if not redirects to the page
  # to have the visitor complete it.
  def require_initial_setup
    # TODO add flash info/notice message
    redirect_to web_signup_path and return unless User.any?
  end

  # before_action
  # Requires the current visitor to be logged in, if not redirects to the login
  # page.
  # TODO spec
  def require_login
    # TODO add flash error message
    redirect_to web_login_path and return unless logged_in?
  end

  # before_action
  # Requires the current visitor to be NOT logged in (to be logged out), if not
  # redirects to the root page.
  # TODO spec
  def require_logout
    # TODO add flash error message
    redirect_to web_root_path and return if logged_in?
  end

end
