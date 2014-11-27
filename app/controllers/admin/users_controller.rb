class Admin::UsersController < ApplicationController
  
  before_action :confirm_admin

  def index
    @users = User.all.page(params[:page]).per(3)
  end


end
