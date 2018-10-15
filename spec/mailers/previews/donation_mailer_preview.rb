# Preview all emails at http://localhost:3000/rails/mailers/donation_mailer
class DonationMailerPreview < ActionMailer::Preview
  def created_notification
    DonationMailer.created_notification(User.first.donations.first, User.first)
  end

  def revocated_notification
    DonationMailer.revocated_notification(Donation.first, User.first)
  end
end
