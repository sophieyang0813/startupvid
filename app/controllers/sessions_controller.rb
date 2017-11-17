class SessionsController < ApplicationController


  def create 
      @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_posts_path(current_user)
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

end
