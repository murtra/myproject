class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
      # user_path(current_user)
      new_post_path
  end


  protected


  def configure_permitted_parameters
    # original  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :username) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :firstname, :lastname) }
    devise_parameter_sanitizer.for(:sign_in) {|u| u.permit(:email, :password)}
  end

end
