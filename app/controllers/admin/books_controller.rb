
class Admin::BooksController < ApplicationController
  before_action :load_book, only: %i(show update edit destroy)

  def index
    @books = Book.list_book
      .page(params[:page]).per Settings.paginate_page
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t "books.create_success"
      redirect_to admin_books_url
    else
      flash[:error] = t "books.create_fail"
      render :new
    end
  end

  def show; end

  def update
    if @book.update_attributes book_params
      flash[:success] = t "books.update_success"
      redirect_to @book
    else
      render :edit
    end
  end

  def edit; end

  def destroy
    @book.destroy
    flash[:success] = t "books.delete_success"
    redirect_to admin_books_url
  end

  private

  def book_params
    params.require(:book).permit :name, :description, :image,
      :author, :number_of_pages, :price, :category_id
  end

  def load_book
    @book = Book.find_by id: params[:id]
    render html: (t "not_found") if @book.nil?
  end
end
