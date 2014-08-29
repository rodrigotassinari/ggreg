class ApplicationController < ActionController::Base

  before_action :require_initial_setup

  private

  # before_action
  def require_initial_setup
    raise NotImplementedError
  end

end
