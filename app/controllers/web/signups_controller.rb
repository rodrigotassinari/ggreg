class Web::SignupsController < BaseWebController

  before_action :abort_if_already_signed_up

  # GET /signup
  # signup_path
  def new
    @user = User.new
  end

  # POST /signup
  # signup_path
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t('.success')
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  # before_action
  def abort_if_already_signed_up
    if User.any?
      flash[:error] = t('.already_signed_up')
      redirect_to root_path
    end
  end

end
