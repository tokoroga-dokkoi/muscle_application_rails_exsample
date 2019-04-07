class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :configure_permitted_parameters, if: :devise_controller?
    after_action :discard_flash_if_xhr

    def after_sign_in_path_for(resource)
        user_url(resource)
    end
    protected
    def configure_permitted_parameters
        added_attrs = [ :email, :user_name, :password, :password_confirmation ]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end

    def discard_flash_if_xhr
        flash.discard if request.xhr?
    end
end
