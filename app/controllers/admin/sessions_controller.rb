class Admin::SessionsController < ApplicationController
  layout "admin/application"
  before_action :verify_logged, except: %i(destroy)

  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user.authenticate params[:session][:password]
      if !user.admin
        flash[:success] = t "permission"
        redirect_to root_url
      else
        log_in user
        redirect_to admin_books_url
      end
    else
      render :new
      flash[:danger] = t "sessions.login_fail"
    end
  end

  def destroy
    log_out
    redirect_to root_url
    flash[:success] = t "sessions.logout_success"
  end

  private

  def verify_logged
    return if !logged_in?
    redirect_to root_url
    flash[:danger] = t "please_logout"
  end
end
