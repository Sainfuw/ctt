class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def admin?
    if !user_signed_in? || current_user.admin != true
      redirect_to root_path, alert: 'No puede acceder a la ruta indicada'
    end
  end
end
