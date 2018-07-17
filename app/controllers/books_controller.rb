class BooksController < ApplicationController
  def show
    @ratings = Rating.by_book params[:id]
    @book = Book.find_by id: params[:id]
    render html: (t "not_found") if @book.nil?
  end
end
