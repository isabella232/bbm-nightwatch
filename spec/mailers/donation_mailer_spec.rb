require "rails_helper"

RSpec.describe DonationMailer, type: :mailer do

  describe "#created_notification" do
    subject(:mail) { DonationMailer.created_notification(donation, user) }

    let(:user) { build :user, name: 'who accepted donation', donations: [donation] }
    let(:donation) { build :donation }

    it "renders the headers" do
      expect(mail.subject).to eq I18n.t('donation.mailer.created_notification.subject')
    end

    it "renders the receiver email" do
      expect(mail.to).to eq [user.email]
    end

    it "renders the food type of the donation to mail body" do
      expect(mail.html_part.body).to include donation.food_type
      expect(mail.text_part.body).to include donation.food_type
    end

    it "renders the quantity of the donation to mail body" do
      expect(mail.html_part.body).to include donation.quantity
      expect(mail.text_part.body).to include donation.quantity
    end

    it "renders the source name of the donation to mail body" do
      expect(mail.html_part.body).to include donation.source_name
      expect(mail.text_part.body).to include donation.source_name
    end

    it "renders the source address of the donation to mail body" do
      expect(mail.html_part.body).to include donation.source_address
      expect(mail.text_part.body).to include donation.source_address
    end

    it "renders the time range of the donation to mail body" do
      expected_time_range = "#{donation.available_from.strftime('%Y-%m-%d %H:%M')} - #{donation.available_to.strftime('%Y-%m-%d %H:%M')}"
      expect(mail.html_part.body).to include expected_time_range
      expect(mail.text_part.body).to include expected_time_range
    end

    context "when comment available for donation" do
      let(:donation) { build :donation, comment: comment }
      let(:comment) { 'comment text' }

      it "renders the comment of the donation to mail body" do
        expect(mail.html_part.body).to include comment
        expect(mail.text_part.body).to include comment
      end
    end

    context "when donation is reported" do
      let(:donation) { build :donation, status: :reported }

      it "renders the call to action text for donation to mail body" do
        expect(mail.html_part.body).to include I18n.t('donation.mailer.created_notification.call_to_action')
        expect(mail.text_part.body).to include I18n.t('donation.mailer.created_notification.call_to_action')
      end

      it "renders the call to action url for donation to mail body" do
        expect(mail.html_part.body).to include new_donation_transport_url(donation)
        expect(mail.text_part.body).to include new_donation_transport_url(donation)
      end
    end
  end

  describe "#revocated_notification" do
    subject(:mail) { DonationMailer.revocated_notification(food_type, quantity, user) }

    let(:user) { build :user, name: 'who accepted donation', donations: [donation] }
    let(:donation) { build :donation, food_type: food_type, quantity: quantity }
    let(:food_type) { 'hamburger' }
    let(:quantity) { 60 }

    it "renders the headers" do
      expect(mail.subject).to eq I18n.t('donation.mailer.revocated_notification.subject')
    end

    it "renders the receiver email" do
      expect(mail.to).to eq [user.email]
    end

    it "renders the food type of the donation to mail body" do
      expect(mail.html_part.body).to include food_type
      expect(mail.text_part.body).to include food_type
    end

    it "renders the quantity of the donation to mail body" do
      expect(mail.html_part.body).to include quantity
      expect(mail.text_part.body).to include quantity
    end
  end
end
