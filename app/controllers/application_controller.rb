class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?


def after_sign_in_path_for(resource)
        case resource
        when Admin
            admins_about_path
        when Customer
            customer_path(:id)
        end
end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:address,:telephone_number,:password,:password_confirmation])
  end
end
