class WelcomeController < ApplicationController
  def index
      if current_user
        redirect_to @user
      end
  end
end
