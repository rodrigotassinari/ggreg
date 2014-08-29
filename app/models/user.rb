class User < ActiveRecord::Base

  has_secure_password

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false, allow_blank: true},
    format: {with: /.+@.+\..+/i, allow_blank: true}

  def email=(value)
    value = value.to_s.downcase unless value.nil?
    super(value)
  end

end
