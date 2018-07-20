class MarkBooksController < ApplicationController
  before_action :verify_login

  def index
    @user_books = UserBook.case_params params[:type]
  end
end
