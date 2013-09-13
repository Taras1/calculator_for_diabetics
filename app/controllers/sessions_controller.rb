class SessionsController < ApplicationController
  require "digest"
  
  def new
  end

  def create
    @user = User.find_by_email(session_email)
    if @user and authenticate
      session[:session_key] = @user.session_key
      redirect_to user_path(id: @user.id)
    else
      flash.now[:error] = "Введен неправельный email  или пароль!"
      render :new
    end
  end

  def destroy
    session[:session_key] = nil
    redirect_to root_path
  end
  
  private
  
  def session_email
    params.require(:session).permit(:email)["email"]
  end
  
  def session_password
    params.require(:session).permit(:password)["password"]
  end
  
  def authenticate
    if Digest::SHA1.hexdigest( session_password ) == @user.password
      return true
    else
      return false
    end
  end
  
end