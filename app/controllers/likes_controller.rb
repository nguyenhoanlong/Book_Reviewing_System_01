class LikesController < ApplicationController
  def create
    if current_user.likes.create history_id: params[:history_id]
      flash[:success] = t "like.create_success"
    else
      flash[:danger] = t "like.create_faild"
    end

    redirect_to root_path
  end

  def destroy
    like = current_user.likes.find_by history_id: params[:history_id]
    if like.destroy
      flash[:success] = t "like.destroy_success"
    else
      flash[:danger] = t "like.destroy_fail"
    end

    redirect_to root_path
  end
end
