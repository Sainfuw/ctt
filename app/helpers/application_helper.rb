module ApplicationHelper
  def admin_check
    (user_signed_in? && current_user.admin) ? true : false
  end

  def get_inscription(u, c)
    Inscription.find_by("user_id = ? and course_id = ?", u.id, c.id)
  end

  # def profesor_check(course_id)
  #   (user_signed_in? && Inscription.find_by(user_id: current_user, course_id: course_id).kind == "Profesor") ? true : false
  # end
  #
  # def ayudante_check(course_id)
  #   (user_signed_in? && Inscription.find_by(user_id: current_user, course_id: course_id).kind == "Ayudante") ? true : false
  # end
  #
  # def alumno_check(course_id)
  #   (user_signed_in? && Inscription.find_by(user_id: current_user, course_id: course_id).kind == "Alumno") ? true : false
  # end
end
