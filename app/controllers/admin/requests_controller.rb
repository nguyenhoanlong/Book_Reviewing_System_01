class Admin::RequestsController < ApplicationController
  before_action :verify_admin
  before_action :load_request, only: %i(edit update)

  def index
    @requests = Request.ordered.includes(:user).page(params[:page])
                       .per Settings.paginate_page
  end

  def edit
    @status = Request.statuses
  end

  def update
    if @request.update_attributes requests_params
      flash[:success] = t "books.update_success"
      redirect_to @request
    else
      render :edit
    end
  end

  private

  def requests_params
    params[:request][:status] = params[:request][:status].to_i
    params.require(:request).permit :name_book, :content, :status
  end

  def load_request
    @request = Request.find_by id: params[:id]
    render html: (t "not_found") if @request.nil?
  end
end
