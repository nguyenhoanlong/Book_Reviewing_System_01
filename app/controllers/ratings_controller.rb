class RatingsController < ApplicationController
  before_action :load_book, only: %i(new create edit update)
  before_action :load_rating, only: %i(edit update)
  before_action :verify_login, only: %i(new create edit update)

  def new
    @rating = Rating.new
  end

  def create
    @rating = current_user.ratings.build rating_params
    @rating.book_id = params[:book_id]
    if @rating.save
      flash[:success] = t "review.create_success"
      redirect_to @book
    else
      render :new
    end
  end

  def edit; end

  def update
    @rating.update_attributes rating_params
    if @rating.save 
      flash[:success] = t "review.update_success"
      redirect_to @book
    else
      flash[:danger] = t "review.update_fail"
      render :edit
    end
  end

  private
  
  def load_rating
    @rating = Rating.find_by id: params[:id]
    render html: (t "rating.not_found_rating") if @rating.nil?
  end

  def load_book
    @book = Book.find_by id: params[:book_id]
    render html: (t "not_found") if @book.nil?
  end

  def rating_params
    params.require(:rating).permit :content, :poin, :title
  end
end
