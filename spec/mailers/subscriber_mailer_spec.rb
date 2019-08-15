require "rails_helper"

RSpec.describe SubscriberMailer, type: :mailer do

  describe "#new_subscription_notification" do
    subject(:mail) { SubscriberMailer.new_subscription_notification(user, subscriber) }

    let(:user) { build :user }
    let(:subscriber) { build :subscriber }

    it "renders the receiver email" do
      expect(mail.to).to eq [user.email]
    end

    it "renders the subject" do
      expect(mail.subject).to eq I18n.t('subscriber.mailer.new_subscription_notification.subject')
    end

    it "renders the subscriber email to mail body" do
      expect(mail.html_part.body).to include subscriber.email
      expect(mail.text_part.body).to include subscriber.email
    end

    it "renders the subject to mail body" do
      expect(mail.html_part.body).to include I18n.t('subscriber.mailer.new_subscription_notification.subject')
      expect(mail.text_part.body).to include I18n.t('subscriber.mailer.new_subscription_notification.subject')
    end

    it "renders invitation text to mail body" do
      expect(mail.html_part.body).to include I18n.t('subscriber.mailer.new_subscription_notification.send_invite')
      expect(mail.text_part.body).to include I18n.t('subscriber.mailer.new_subscription_notification.send_invite')
    end

    it "renders invitation link to mail body" do
      expect(mail.html_part.body).to include new_user_invitation_url(subscriber)
      expect(mail.text_part.body).to include new_user_invitation_url(subscriber)
    end
  end

  describe "#welcome_notification" do
    subject(:mail) { SubscriberMailer.welcome_notification(subscriber) }

    let(:subscriber) { build :subscriber }

    it "targets the subscriber" do
      expect(mail.to).to eq [subscriber.email]
    end

    it "sets the subject" do
      expect(mail.subject).to eq I18n.t('subscriber.mailer.welcome_notification.subject')
    end
  end
end
