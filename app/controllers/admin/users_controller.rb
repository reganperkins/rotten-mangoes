class Admin::UsersController < ApplicationController
  
  before_action :confirm_admin

  def index
    @users = User.all.page(params[:page]).per(3)
  end

  def edit
    @user = User.find(params[:id])
    render :'users/edit'
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_path
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      render :'users/edit'
    end
  end

end
