class CategoryBooksController < ApplicationController
  def index
    @categories = Category.list
    if params[:cat_id].blank?
      book = Book.ordered
    else
      book = Book.filter_by_category params[:cat_id]
      @category = Category.find_by id: params[:cat_id]
    end

    @books = book.page(params[:page]).per Settings.paginate_page_book_cat
  end
end
