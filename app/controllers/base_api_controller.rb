class BaseApiController < ApplicationController
  # Prevent CSRF attacks by nullifying the session.
  protect_from_forgery with: :null_session

  private

  # before_action
  def require_initial_setup
    render(json: {errors: {message: 'Initial setup not done yet.'}}, status: 418) and return unless User.any?
  end

end
