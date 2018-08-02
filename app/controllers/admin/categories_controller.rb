class Admin::CategoriesController < ApplicationController
  layout "admin/application"
  before_action :verify_admin
  before_action :load_category, except: %i(index new create)

  def index
    @categories = Category.by_title(params[:keyword])
                          .page(params[:page]).per Settings.paginate_page
    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category. new category_params
    if @category.save
      flash[:success] = t "create_success"
      redirect_to admin_categories_path
    else
      render :new
      flash[:danger] = t "create_fail"
    end
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "update_success"
      redirect_to @request
    else
      render :edit
      flash[:danger] = t "delete_faild"
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "delete_success"
    else
      flash[:danger] = t "create_success"
    end

    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit :title, :description
  end

  def load_category
    @category = Category.find_by id: params[:id]
    render html: (t "not_found") if @category.nil?
  end
end
