class Web::SessionsController < BaseWebController

  before_action :require_logout, only: [:new, :create]
  before_action :require_login, only: [:destroy]

  # GET /login
  # web_login_path
  def new
    @session = Session.new({}, session)
  end

  # POST /login
  # web_login_path
  def create
    @session = Session.new(session_params, session)
    if @session.authenticate
      flash[:success] = t('.success', name: @session.user.email)
      redirect_to web_root_path
    else
      render :new
    end
  end

  # GET /logout
  # web_logout_path
  # TODO spec
  def destroy
    Session.destroy(session)
    flash[:notice] = t('.success')
    redirect_to web_root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
