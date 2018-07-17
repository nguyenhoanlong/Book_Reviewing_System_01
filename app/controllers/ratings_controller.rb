class RatingsController < ApplicationController
  before_action :load_book, only: %i(new create edit update destroy)
  before_action :load_rating, only: %i(edit update destroy)
  
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

  def destroy
    @rating.destroy
  end

  private
  
  def load_rating
    @rating = Rating.find_by id: params[:id]
  end

  def load_book
    @book = Book.find_by id: params[:book_id]
  end

  def rating_params
    params.require(:rating).permit :content, :poin, :title
  end
end
