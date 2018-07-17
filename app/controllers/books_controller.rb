class BooksController < ApplicationController
  def show
    @ratings = Rating.by_book params[:id]
    @book = Book.find_by id: params[:id]
    @user_book = load_user_book.nil? ? UserBook.new : UserBook.by_book(params[:id],
                                                              current_user.id).first
    render html: (t "not_found") if @book.nil?
  end

  private

  def load_user_book
    UserBook.by_book(params[:id], current_user.id).first if logged_in?
  end
end
