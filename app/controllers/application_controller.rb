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
end
