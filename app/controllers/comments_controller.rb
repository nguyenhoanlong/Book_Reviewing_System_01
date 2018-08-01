class CommentsController < ApplicationController
  before_action :load_book, :load_rating
  before_action :load_comment, only: %i(show edit update destroy)
  before_action :check_user_comment, only: %i(edit destroy)

  def show; end

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end

  def create
    @comment = current_user.comments.build comment_params
    @comment.rating_id = params[:rating_id]
    if @comment.save
      SendEmailToUserCommentWorker.perform_async @rating.id, current_user.id
      flash[:success] = t "comments.create_success"
    else
      flash[:danger] = t "comments.create_falid"
    end
  
    respond_to do |format|
      format.js
    end
  end

  def edit; end

  def update
    if @comment.update_attributes comment_params
      flash[:success] = t "update_success"
    else
      flash[:danger] = t "update_fail"
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = t "delete_success"
    else
      flash[:danger] = t "delete_faild"
    end
  end

  private

  def load_book
    @book = Book.find_by id: params[:book_id]
    render html: (t "not_found") if @book.nil?
  end

  def load_rating
    @rating = Rating.find_by id: params[:rating_id]
    render html: (t "not_found") if @rating.nil?
  end

  def load_comment
    @comment = Comment.find_by id: params[:id]
    render html: (t "not_found") if @comment.nil?
  end

  def comment_params
    params.require(:comment).permit :content
  end

  def check_user_comment
    return if current_user != @comment.user
  end
end
