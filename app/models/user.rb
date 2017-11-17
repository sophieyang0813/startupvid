class User < ApplicationRecord
  has_secure_password

   # def password
   #  @password ||= Password.new(password_digest)
   # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_digest = @password
  # end

  # def self.authenticate(email)
  #   @user = User.find_by(email: email)
  #   byebug 
  #   if @user && @user.password_digest == BCrypt::Engine.hash_secret(password, user.password_salt)
  #     user 
  #   byebug
  #   else 
  #     nil 
  #   end 


  # end 


end
