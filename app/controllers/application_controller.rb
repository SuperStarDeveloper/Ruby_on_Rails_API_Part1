class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, except: [:create,:destroy,:destroy]
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name,:role])
  end

end
