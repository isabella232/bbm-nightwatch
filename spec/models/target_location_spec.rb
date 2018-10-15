require 'rails_helper'

RSpec.describe TargetLocation, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:address) }
  # it { is_expected.to validate_presence_of(:phone) }
  # it { is_expected.to validate_presence_of(:email) }
  # it { is_expected.to allow_value('user@example.com').for(:email) }
  # it { is_expected.to validate_presence_of(:contact_name) }
  # it { is_expected.to validate_presence_of(:capacity) }
  describe "#contact_information" do
    subject(:retrive_contact_information) { target_location.contact_information }

    context "when all information are available" do
      let(:target_location) { build(:target_location) }

      it "returns email, phone number, contact name concatenated into one" do
        expect(retrive_contact_information).to eq("#{target_location.contact_name}, #{target_location.phone}, #{target_location.email}")
      end
    end

    context "when some information missing" do
      let(:target_location) { build(:target_location, contact_name: "", email: nil) }

      it "removes every missing contact information from the list" do
        expect(retrive_contact_information).to eq("#{target_location.phone}")
      end
    end
  end
end