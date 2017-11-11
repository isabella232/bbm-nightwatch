class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name, :phone])
    devise_parameter_sanitizer.permit(:invite, keys: [:name, :phone, :email])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :phone, :email])
  end
end
