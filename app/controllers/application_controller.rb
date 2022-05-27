class ApplicationController < ActionController::Base
  #before_action :authenticate_customer!, except: [:top, :about]
  #before_action :authenticate_admin!, except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?


  private
  def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
          admin_root_path
      else
          public_customer_customers_my_page_path(current_customer)
      end
  end

  def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :customer
          public_root_path
      elsif resource_or_scope == :admin
          new_admin_session_path
      else
          root_path
      end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
