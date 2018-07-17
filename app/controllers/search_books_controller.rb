class SearchBooksController < ApplicationController
  def index
    @books = Book.like_by_name_author params[:search]
    if params[:txt_search]
      @books = Book.like_by_name_author params[:txt_search]
    else
      respond_to do |format|
        format.js
      end
    end
  end
end
