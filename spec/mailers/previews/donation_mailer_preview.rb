# Preview all emails at http://localhost:5100/rails/mailers/donation_mailer
class DonationMailerPreview < ActionMailer::Preview
  def created_notification
    DonationMailer.created_notification(User.first.donations.first, User.first)
  end

  def revocated_notification
    donation = Donation.first
    DonationMailer.revocated_notification(donation.food_type, donation.quantity, User.first)
  end
end
