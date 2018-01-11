class UsersController < ApplicationController
  skip_after_action :verify_authorized

  def show
    @user = User.friendly.find(params[:id])
  end
end
