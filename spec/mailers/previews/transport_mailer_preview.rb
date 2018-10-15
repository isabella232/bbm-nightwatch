# Preview all emails at http://localhost:3000/rails/mailers/transport_mailer
class TransportMailerPreview < ActionMailer::Preview
  def transport_cancelled_notification
    TransportMailer.transport_cancelled_notification(User.first.transports.first, User.first)
  end
end
