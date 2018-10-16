class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: :update
  
  def new
    redirect_to root_path
  end

  def create
    redirect_to root_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :account_update, keys: [:email_notification]
  end
end
