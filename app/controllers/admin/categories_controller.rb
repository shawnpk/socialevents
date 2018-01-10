class Admin::CategoriesController < Admin::ApplicationController
  def index
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
  end

  def destroy
  end

  private
    def category_params
      params.require(:category).permit(:name, :summary)
    end
end
