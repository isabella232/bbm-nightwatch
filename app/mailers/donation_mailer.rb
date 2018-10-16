class DonationMailer < ApplicationMailer
  def created_notification(donation, user)
    @donation = donation
    @user = user
    mail to: @user.email, subject: I18n.t('donation.mailer.created_notification.subject')
  end

  def revocated_notification(donation_food_type, donation_quantity, user)
    @donation_food_type = donation_food_type
    @donation_quantity = donation_quantity
    @user = user
    mail to: @user.email, subject: I18n.t('donation.mailer.revocated_notification.subject')
  end
end
