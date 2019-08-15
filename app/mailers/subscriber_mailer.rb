class SubscriberMailer < ApplicationMailer
  def new_subscription_notification(user, subscriber)
    @subscriber = subscriber
    mail to: user.email, subject: I18n.t('subscriber.mailer.new_subscription_notification.subject')
  end

  def welcome_notification(subscriber)
    mail to: subscriber.email, subject: I18n.t('subscriber.mailer.welcome_notification.subject')
  end
end
