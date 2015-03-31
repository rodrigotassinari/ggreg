class BaseWebAdminController < BaseWebController

  before_action :require_login

end
