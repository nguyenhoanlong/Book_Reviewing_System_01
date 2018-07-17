class CommentsController < ApplicationController
  before_action :verify_login, only: %i(new create edit update destroy)
  before_action :load_rating, only: %i(new create)
  before_action :load_book, only: %i(new create)
  before_action :load_comment, only: %i(show edit update destroy)

  def index

  end

  def new
    @comment = Comment.new
  end
  
  def create
  end

  def show
  end

  def edit; end

  def update
  end

  def destroy
  end

  private

  def load_comment
    @comment = Comment.find_by id: params[:id]
  end

  def load_rating
    @rating = Rating.find_by id: params[:rating_id]
  end

  def load_book
    @book = Book.find_by id: params[:book_id]
  end

  def rating_params
    params.require(:comment).permit :content
  end
end
