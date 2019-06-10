class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?

protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :tel])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :address, :tel])
    end

end
