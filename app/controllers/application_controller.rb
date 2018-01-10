class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :verify_authorized, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :organization_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :organization_name])
    end

    def user_not_authorized
      flash[:alert] = 'You are not authorized to perform that action.'
      redirect_to(request.referrer || root_path)
    end
end
