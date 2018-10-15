class TransportMailer < ApplicationMailer
  def transport_cancelled_notification(transport, user)
    @donation = transport.donation
    @user = user
    mail(to: @user.email, subject: I18n.t('transport.mailer.transport_cancelled_notification.subject'))
  end
end
