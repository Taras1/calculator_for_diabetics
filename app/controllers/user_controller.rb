class UserController < ApplicationController
  
  before_filter :sign_in, :only => [:show, :destroy]
  before_filter :confirm_email?, :only => [:show]
  before_filter :current_user
  
  def new
     @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to sign_in_path
    else
      flash.now[:error] = "Ошибки заполнения формы!"
      render :new
    end
    
  end

  def show
    @user
  end
  
  def edit
    render :edit
  end

  def destroy
  end
  
  def confirm_email_page
    
  end
  
  def confirm_email
    if @user.code_confirm == code_confirm_params
      @user.update(:confirm_email => true)
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = "Вы ввели неправелный код. Вы также можете указать новый Email на странице редактирования профиля или попробывать получить код еще раз."
      render :confirm_email_page
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:full_name, :birthday, :phone_number, :city, :address, :email, :password)
  end
  
  def code_confirm_params
    params.require(:confirm_email).permit(:code_confirm)["code_confirm"]
  end
  
  def confirm_email?
    @user = current_user
    unless @user.confirm_email
      redirect_to user_confirm_email_page_path(user_id: @user.id)
    end
  end
  
end
