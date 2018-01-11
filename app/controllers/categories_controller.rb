class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  skip_after_action :verify_authorized

  def show
    @categories = Category.order('name')
  end

  private
    def set_category
      @category = Category.friendly.find(params[:id])

      rescue ActiveRecordNotFound
        flash[:alert] = 'The category you were looking for does not exist.'
        redirect_to(request.referrer || events_url)
    end
end
