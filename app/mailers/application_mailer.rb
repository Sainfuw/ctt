class ApplicationMailer < ActionMailer::Base
  default from: 'pruebacttstream@gmail.com'
  #layout 'mailer'

  def bienvenida_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def modificacion_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def inscripcion_email(user)No guardar mi historial de reproducciones 
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

end
