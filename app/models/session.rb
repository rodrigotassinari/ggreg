class Session
  include ActiveModel::Model

  attr_accessor :email, :password, :http_session
  attr_reader :user

  validates :email, presence: true, format: {with: /.+@.+\..+/i, allow_blank: true}

  validates :password, presence: true

  # validates :user, presence: true

  def initialize(params, http_session, user_class=User)
    @email = params[:email].to_s.downcase
    @password = params[:password].to_s
    @http_session = http_session
    @user = user_class.find_by(email: email)
  end

  def authenticate
    return false unless valid?
    user_exists? &&
      correct_password? &&
      write
  end

  # TODO spec
  def self.authenticated_user(http_session)
    return nil if http_session[:user_id].blank?
    User.find_by_id(http_session[:user_id])
  end

  # TODO spec
  def self.authenticated?(http_session)
    !authenticated_user(http_session).nil?
  end

  # TODO spec
  def self.destroy(http_session)
    http_session[:user_id] = nil
    http_session.destroy if http_session.respond_to?(:destroy)
    true
  end

  def persisted?
    false
  end

  private

  def write
    reset_session
    http_session[:user_id] = user.id
    true
  end

  def user_exists?
    !user.nil?
  end

  def correct_password?
    user.authenticate(password)
  end

  private

  # taken from https://github.com/rails/rails/blob/ce148025f221b75c82020782a5adef58a07de98c/actionpack/lib/action_dispatch/http/request.rb#L255
  def reset_session
    if http_session && http_session.respond_to?(:destroy)
      http_session.destroy
    else
      http_session = {}
    end
  end

end
