class UserBooksController < ApplicationController
  before_action :load_user_book, only: %i(create update)
  before_action :load_book, only: %i(create update)

  def new; end

  def create
    @user_book = current_user.user_books.build user_book_params
    @user_book.book_id = params[:book_id]
    if @user_book.save
      @success = true
      make_history @book, Settings.user_mark_book
    else
      @success = false
    end
  end

  def update
    if @user_book.update_attributes user_book_params
      make_history @book, Settings.user_mark_book
      @success = true
    else
      @success = false
    end
  end

  private

  def load_book
    @book = Book.find_by id: params[:book_id]
    render html: (t "not_found") if @book.nil?
  end

  def load_user_book
    @user_book = UserBook.by_book(params[:book_id], current_user.id).first
  end

  def user_book_params
    params.require(:user_book).permit :read, :reading, :favorite
  end
end
