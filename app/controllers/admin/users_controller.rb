class Admin::UsersController < ApplicationController
  
  before_action :confirm_admin

  def index
  #@users = User.find(params[:id]).page(params[:id]).per(1)
  # @users = User.all.page.per(10)
  # @users = User.all.page(params[:page]).per(10)
  # @users = User.where(role: 0).page(params[:page]).per(10)
    @users = User.scoped.page(params[:page]).per(10)

  end


end
