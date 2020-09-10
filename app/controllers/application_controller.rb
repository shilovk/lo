class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      respond_to do |format|
        format.html { redirect_to root_url, alert: exception.message }
        format.js { render params[:action], status: :unauthorized }
        format.json { render json: {}, status: :unauthorized }
      end
    else
      session[:next] = request.fullpath
      redirect_to new_user_session_path, alert: 'You have to log in to continue.'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
