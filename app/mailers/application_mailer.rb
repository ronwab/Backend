# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'ronald.wabukenda@gmail.com'
  layout 'mailer'
end
