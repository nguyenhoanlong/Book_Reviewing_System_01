class Admin::RequestsController < ApplicationController
  layout "admin/application"
  before_action :verify_admin
  before_action :load_request, only: %i(edit update)

  def index
    requests = params[:status].blank? ? Request.ordered : Request.ordered.by_status(params[:status])
    respond_to do |format|
      format.js
      format.html
    end

    @requests = requests.includes(:user).page(params[:page])
                       .per Settings.paginate_page
  end

  def edit
    @status = Request.statuses
  end

  def update
    if @request.update_attributes requests_params
      SendEmailUserRequestWorker.perform_async @request.id
      flash[:success] = t "books.update_success"
      redirect_to admin_requests_url
    else
      render :edit
    end
  end

  private

  def requests_params
    params[:request][:status] = params[:request][:status].to_i
    params.require(:request).permit :name_book, :content, :status, :reason
  end

  def load_request
    @request = Request.find_by id: params[:id]
    render html: (t "not_found") if @request.nil?
  end
end
