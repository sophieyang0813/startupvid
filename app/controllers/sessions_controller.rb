class SessionsController < ApplicationController

  def create 
      @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:warning] = "Invalid username or password"
      redirect_to new_session_path
    end 
  end

  def destroy
    session[:user_id] = nil 
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end 


  #facebook omniauth
   def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

    # if: previously already logged in with OAuth
    if authentication.user
      user = authentication.user
      authentication.update_token(auth_hash)
      @next = root_url
      @notice = "Signed in!!!"
          # else: user logs in with OAuth for the first time
    else
      user = User.create_with_auth_and_hash(authentication, auth_hash)
      # you are expected to have a path that leads to a page for editing user details
      @next = edit_user_path(user.id)
      @notice = "User created. Please confirm or edit details"
    end

    signin(user)
    redirect_to @next, :notice => @notice
  end

end
