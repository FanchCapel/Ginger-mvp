class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:primary_first_name, :primary_last_name, :primary_number])

    # For additional in app/views/devise/registrations/edit.html.erb
    # TODO
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  helper_method :admin?

  def admin?
    signed_in? ? current_user.admin : false
  end

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_index_path
    else
      new_experience_path
    end
  end
end
