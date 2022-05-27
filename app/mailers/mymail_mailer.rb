class MymailMailer < ApplicationMailer
  default from: 'christophe126@gmail.com'

  def welcome_email(new_or_support)
    @usr = 'christophe126@gmail.com'
    @new_version = Version.where(new_version: new_or_support).last
    mail(to: @usr, subject: 'Ruby Checker Version for Ouvrages by Christophe126')
  end
end
