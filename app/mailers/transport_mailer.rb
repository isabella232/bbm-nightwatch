class TransportMailer < ApplicationMailer
  def transport_cancelled_notification(transport, user)
    @donation = transport.donation
    @user = user
    food = ::I18n.t 'posts.group_message.subject', qty: @donation.quantity, food: @donation.food_type
    mail(to: @user.email, subject: I18n.t('transport.mailer.transport_cancelled_notification.subject', food: food))
  end

  def transport_taken_on_notification(transport)
    user = transport.donation.user
    @donation = transport.donation
    @transporter = transport.transporter
    mail(to: user.email, subject: I18n.t('transport.mailer.transport_taken_on_notification.subject'))
  end
end
