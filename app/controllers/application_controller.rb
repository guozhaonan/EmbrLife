class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:account_update) << :username
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :college
    devise_parameter_sanitizer.for(:account_update) << :college
    devise_parameter_sanitizer.for(:sign_up) << :bio
    devise_parameter_sanitizer.for(:account_update) << :bio
    devise_parameter_sanitizer.for(:sign_up) << :values
    devise_parameter_sanitizer.for(:account_update) << :values
    devise_parameter_sanitizer.for(:sign_up) << :interests
    devise_parameter_sanitizer.for(:account_update) << :interests
  end
end
