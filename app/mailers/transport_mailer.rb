class TransportMailer < ApplicationMailer
  def transport_cancelled_notification(donation, user)
    @donation = donation
    @user = user
    food = ::I18n.t 'posts.group_message.subject', qty: @donation.quantity, food: @donation.food_type
    mail(to: @user.email, subject: I18n.t('transport.mailer.transport_cancelled_notification.subject', food: food))
  end

  def transport_taken_on_notification(transport)
    user = transport.donation.user
    @donation = transport.donation
    @transporter = transport.transporter
    food = ::I18n.t 'posts.group_message.subject', qty: @donation.quantity, food: @donation.food_type
    mail(to: user.email, subject: I18n.t('transport.mailer.transport_taken_on_notification.subject', food: food))
  end
end
