require 'rails_helper'

RSpec.describe TransportMailer, type: :mailer do
  describe '#transport_taken_on_notification' do
    subject(:mail) { TransportMailer.transport_taken_on_notification(transport) }

    let(:user) { build :user, name: 'who makes a donation' }
    let(:donation) { build :donation, user: user }
    let(:transporter) { build :user, name: 'transporter' }
    let(:transport) { build :transport, donation: donation, transporter: transporter }

    it 'renders the headers' do
      food = ::I18n.t 'posts.group_message.subject', qty: donation.quantity, food: donation.food_type
      expect(mail.subject).to eq(I18n.t('transport.mailer.transport_taken_on_notification.subject', food: food))
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the name of transporter to mail body' do
      expect(mail.html_part.body).to include(transporter.name)
      expect(mail.text_part.body).to include(transporter.name)
    end
  end
end
