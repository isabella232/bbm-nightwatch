require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe "#valid?" do
    context "when source_name is not given" do
      subject(:source_name) { Donation.new(source_address: "Some address", quantity: 50, food_type: "Soup", anonymous: true, information_source: "Jane Doe", status: "OK").valid? }

      it { is_expected.to eq false }
    end

    context "when quantity is lower than minimal donation quantity" do
      subject(:source_name) { Donation.new(source_name: "John Doe's restaurant", source_address: "Some address", quantity: 5, food_type: "Soup", anonymous: true, information_source: "Jane Doe", status: "OK").valid? }

      it { is_expected.to eq false }
    end
  end
end
