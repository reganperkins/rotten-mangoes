class Admin::UsersController < ApplicationController
  
  before_action :confirm_admin

  def index
    @users = User.all.page(params[:page]).per(3)
  end

  def edit
    @user = User.find(params[:id].to_i)  #to_i becouse users are maliciuse :)
    render :'users/edit'
  end

  # def new
  #   @user = User.new
  # end

  def destroy
    User.find(params[:id].to_i).destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_path
  end

  def update
    @user = User.find(params[:id].to_i)

    if @user.update_attributes(user_params)
      redirect_to admin_users_path
    else
      render :'users/edit'
    end
  end

  def change_user
    session[:user_id] = params[:id]
    redirect_to movies_path
  end

  # for admin to create a new user
  # def create
  #   @user = User.new
  #   if user.save
  #     confirm{ }
  #   else
  #   end
  # end

  # protected

  # 

  # def user_params
  #   params.require(:user).permit(:email, :firstname, :lastname, :admin)
  # end

end
