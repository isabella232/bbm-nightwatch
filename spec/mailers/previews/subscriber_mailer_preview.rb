# Preview all emails at http://localhost:5100/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview
  def new_subscription_notification
    SubscriberMailer.new_subscription_notification(User.admins.first, Subscriber.first)
  end
end
