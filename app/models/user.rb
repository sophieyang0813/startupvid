class User < ApplicationRecord
  has_secure_password
  has_many :authentications, dependent: :destroy
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :first_name, presence: true 
  validates :last_name, presence: true 



  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      first_name: auth_hash["info"]["name"].split[0],
      last_name: auth_hash["info"]["name"].split[1],
      email: auth_hash["info"]["email"],
      password: (('a'..'z').to_a + ('0'..'9').to_a).sample(8).join )
    user.authentications << authentication
    return user
  end

   # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end

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
