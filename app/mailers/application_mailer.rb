class ApplicationMailer < ActionMailer::Base
  default from: 'goodworkmailer@gmail.com'
  layout 'mailer'

  def welcome_mailer(user)
    @user = user
    @specialtext = `Hello #{user}, thank you for joining us at Good Work. We are so excited to see what you are able to accomplish!`
    mail(to: `#{user.email}`, subject: `Welcome to Good Work`)
  end
end
