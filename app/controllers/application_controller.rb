class ApplicationController < ActionController::Base
    
    def after_sign_in_path_for(resource)
        memos_path
    end

    # protect_form_forgery with: :exception

    before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
    end
end
