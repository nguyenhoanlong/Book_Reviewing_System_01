class UsersController < ApplicationController
  before_action :load_user, only: %i(show edit update)

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
    @user_follower = @user.followers.ordered.page(params[:page])
      .per Settings.paginate_page
    @user_following = @user.following.ordered.page(params[:page])
      .per Settings.paginate_page
    respond_to do |format|
      format.js
      format.html
    end
  end

  def edit; end
  
  def update
    if @user.update_attributes user_params
      flash[:success] = t "review.create_success"
      redirect_to @user
    else
      render :edit
    end

    @user = User.find_by id: params[:id]
    @user_follower = @user.followers
    @user_following = @user.following
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    render html: (t "not_found") if @user.nil?
  end

  def user_params
    params.require(:user).permit :name, :email, :phone, :avatar,
      :password, :password_confirmation
  end
end
