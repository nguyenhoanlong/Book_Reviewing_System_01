class StaticPagesController < ApplicationController
  before_action :verify_login

  def home
    books = Book.like_by_name_author(params[:keyword])
    books = books.filter_by_category(params[:cat_id]) unless params[:cat_id].blank?
    respond_to do |format|
      format.js
      format.html {books = Book.ordered}
    end

    @books = books.ordered.page(params[:page])
      .per Settings.paginate_page
  end

  def show
    @book = Book.find_by id: params[:id]
  end
end
