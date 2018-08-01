class SessionsController < ApplicationController
  before_action :verify_logged, except: %i(destroy)

  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user &. authenticate params[:session][:password]
      if user.activated?
        log_in user
        flash[:success] = t "sessions.login_success"
        redirect_to user
      else
        flash[:infor] = t "users.create.check_email"
        redirect_to root_url
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
