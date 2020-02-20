# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'ronald.wabukenda@gmail.com'
  def signup_confirmation(contact)
    @contact=contact
    mail to: @contact.email, subject: 'Signup Confirmation'
  end
end
