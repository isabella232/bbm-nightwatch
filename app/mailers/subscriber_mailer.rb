class SubscriberMailer < ApplicationMailer
  def new_subscription_notification(user, subscriber)
    @subscriber = subscriber
    mail(to: user.email, subject: I18n.t('subscriber.mailer.new_subscription_notification.subject'))
  end
end
