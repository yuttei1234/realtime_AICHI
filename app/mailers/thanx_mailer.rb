class ThanxMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.thanx_mailer.complete_registration.subject
  #
  def complete_registration(user)
    @user = user
    mail(:subject => "ご登録有難うございます！！", to: user.email)
  end
end