class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #before_action :authenticate_user!,except: [:top, :about]
  #before_action :authenticate_admin!,except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user
      public_post_images_path
    else
      admins_path
    end
  end

  protected

  def configure_permitted_parameters
    if resource_class == User
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :telephone_number, :introduction])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
    end
  end

  # def after_sign_out_path_for(resource)
  #   if resource == :admin
  #     new_admin_session_path
  #   else
  #     root_path
  #   end
  # end

end