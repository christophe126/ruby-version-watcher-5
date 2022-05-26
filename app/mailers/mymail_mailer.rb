class MymailMailer < ApplicationMailer
  default from: 'christophe126@gmail.com'

  def welcome_email
    @usr = 'christophe126@gmail.com'
    @new_version = Version.last
    mail(to: @usr, subject: 'Ruby Checker Version for Ouvrages by Christophe 126')

  end
end
