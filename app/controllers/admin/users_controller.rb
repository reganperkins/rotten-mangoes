class Admin::UsersController < ApplicationController
  
  before_action :confirm_admin

  def index
    render :index
  end


end
