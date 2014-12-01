class DeleteMailer < ActionMailer::Base
  default from: 'reganlperkins@gmail.com'

  def goodbye_email(user)
    @user = user
    email_with_name = "#{@user.name} <#{@user.email}>"
    # @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Sorry your leaving my awesome site')
  end
  
end