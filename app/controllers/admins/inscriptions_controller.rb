class Admins::InscriptionsController < ApplicationController
  before_action :set_inscription, only: [:edit, :update, :destroy]
  before_action :admin?

  def index
    @inscriptions = Inscription.all
  end

  def edit
    @user = User.find(@inscription.user_id)
  end

  def update
    @inscription.update(inscription_params)
    redirect_to admins_users_path, notice: 'Inscription was successfully updated.'
  end

  def destroy
    @inscription.destroy
    redirect_to admins_course_path(Course.find(@inscription.course_id)), notice: 'Usuario removido satisfactoriamente del curso'
  end

  private
  def set_inscription
    @inscription = Inscription.find(params[:id])
  end

  def inscription_params
    params.require(:inscription).permit(:user_id, :course_id, :kind)
  end
end
