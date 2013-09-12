class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  
  def current_user
    @user = User.find_by_session_key(session[:session_key])
  end
  
  def sign_in
    unless session[:session_key]
      flash[:error] = "Войдите на сайт или зарегестрируйтесь!"
      redirect_to welcome_index_path
    end
  end
  
end
