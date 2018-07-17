class MarkBooksController < ApplicationController
  before_action :verify_login

  def index
    @requests = Request.by_user current_user
  end
end
