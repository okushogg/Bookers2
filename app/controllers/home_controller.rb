class HomeController < ApplicationController
  
  def top
    @user = current_user
  end
  
  def about
    @user = current_user
  end
  
end
