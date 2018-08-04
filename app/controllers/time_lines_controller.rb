class TimeLinesController < ApplicationController
  before_action :verify_login

  def index
    @histories = History.by_following(current_user).ordered
    .limit(Settings.limit_record) if logged_in?
    @books = Book.limit(Settings.paginate_home_page).ordered
  end
end
