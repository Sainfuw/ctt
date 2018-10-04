class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def admin?
    if !user_signed_in? || current_user.admin != true
      redirect_to root_path, alert: 'No puede acceder a la ruta indicada'
    end
  end

  protected
    def after_sign_in_path_for(resource)
    # return the path based on resource
    if current_user.admin
      admins_path
    else

      courses_inscriptions_path
    end
    end
end
