class ApplicationMailer < ActionMailer::Base
  default from: ENV["GOOGLE_USERNAME"]
  layout 'mailer'
end