class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.strip.downcase)
    return user if user && user.authenticate(password)
    nil
  end

end


