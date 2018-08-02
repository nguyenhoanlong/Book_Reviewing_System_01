module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  def current_user_admin
    @current_user ||= User.find_by id: session[:user_id] if is_admin?
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  def is_admin?
    current_user.admin if logged_in?
  end
end
