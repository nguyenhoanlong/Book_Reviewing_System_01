class MyRequestsController < ApplicationController
  before_action :verify_loggin

  def index
    @requests = Request.by_user current_user
  end
end
