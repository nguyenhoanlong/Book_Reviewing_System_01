class SearchUsersController < ApplicationController
  def index
    user = User.find_by id: params[:user_id]
    render html: (t "not_found") if user.nil?
    if params[:from_tab] == Settings.from_tab_follower.to_s
      users = user.followers
    elsif params[:from_tab] == Settings.from_tab_following.to_s
      users = user.following
    end

    @users = users.like_by_name_email params[:keyword]
  end
end
