class ApplicationController < ActionController::Base
      # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :display_name, :password) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :display_name, :password, :current_password) }
        end
end
