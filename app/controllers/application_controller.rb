class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # perform a sign-up along with the signin data
    devise_parameter_sanitizer.permit(:sign_in, keys: [:signin])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, 
                                                       :last_name, 
                                                       :email, 
                                                       :username, 
                                                       :password, 
                                                       :password_confirmation])
  end
end
