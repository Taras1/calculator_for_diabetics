class GroupProductsController < ApplicationController
  before_filter :sign_in?
  before_filter :current_user
  before_filter :admin?
  
  def index
    @groups_product = GroupProduct.all
  end
  
  def new
    
  end
  
  def create
    
  end
  
  def destroy
    
  end
  
end
