require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:phone) }

  describe '#to_be_notified_in_email' do
    it 'returns only users who requested to be notified in email' do
      user1 = create :user, email_notification: true
      user2 = create :user, email_notification: false

      expect(User.to_be_notified_in_email.all).to eq [user1]
    end
  end
end
