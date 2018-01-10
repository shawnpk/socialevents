class Admin::CategoriesController < Admin::ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.order(:name)
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Category successfully created.'
      redirect_to admin_categories_path
    else
      flash[:alert] = 'There was a problem creating your category.'
      render :new
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category successfullt updated.'
      redirect_to admin_categories_path
    else
      flash.now[:alert] = 'There was a problem updating this category.'
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:alert] = "The #{@category.name} category has been deleted."
    redirect_to admin_categories_path
  end

  private
    def category_params
      params.require(:category).permit(:name, :summary)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
