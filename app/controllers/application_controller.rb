class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
   
  rescue_from Pundit::NotAuthorizedError do |exception|
    if current_user
      redirect_to root_url, alert: exception.message
    else
      redirect_to new_user_session_path
    end
  end

  #create an acivity for speficic user actions. See controller methods for Objects.
  def track_activity(trackable, action = params[:action])
    current_user.activities.create! action: action, trackable: trackable
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end