class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  @current_page = 'default'
 

  protected

  helper_method :current_user
  helper_method :is_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def is_admin?
    current_user && (current_user.role == 'admin')
  end

  def confirm_admin
    if !session[:admin_id] # if !(current_user && current_user.role == 'admin')
      flash[:notice] = "You you do not have access to the page you requested"
      redirect_to movies_path
    end
  end

end
