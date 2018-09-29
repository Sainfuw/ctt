require 'sendgrid-ruby'

class SengridApiMailer
  include SendGrid

  @@from = "streaming@desafiolatam.com"

  def self.welcome_teacher(user)
    mail = Mail.new
    mail.from = Email.new(email: @@from)
    mail.subject = "Bienvenido Profesor"
    personalization = Personalization.new
    personalization.add_to(Email.new(email: user.email))
    personalization.add_substitution(Substitution.new(key: '-url-', value: Authorization.confirmation_email_url(token) ))

    mail.add_personalization(personalization)
    mail.template_id = '85dfa8b1-73fe-4c77-90de-addfeafc9bf9'

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])

    begin
      response = sg.client.mail._("send").post(request_body: mail.to_json)
    rescue Exception => e
      puts e.message
    end
  end

end