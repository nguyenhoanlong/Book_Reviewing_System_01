class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "users.create.check_email"
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
    @user_follower = @user.followers
    @user_following = @user.following
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :phone, :avatar,
      :password, :password_confirmation
  end
end
