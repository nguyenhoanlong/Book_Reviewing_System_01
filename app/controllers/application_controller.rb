class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def verify_admin
    return if logged_in? && is_admin?
    flash[:danger] = t "permission"
    redirect_to root_url
  end

  def verify_login
    return if logged_in?
    flash[:danger] = t "please_login"
    redirect_to login_url
  end

  def make_history object, type
    object.histories.create user_id: current_user.id, type_history: type
  end
end
