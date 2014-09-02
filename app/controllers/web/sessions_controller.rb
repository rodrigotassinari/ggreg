class Web::SessionsController < BaseWebController

  # GET /login
  # login_path
  def new
    @session = Session.new({}, session)
  end

  # POST /login
  # login_path
  def create
    @session = Session.new(session_params, session)
    if @session.authenticate
      flash[:success] = t('.success')
      redirect_to root_path
    else
      render :new
    end
  end

  # GET /logout
  # logout_path
  def destroy
    # TODO
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
