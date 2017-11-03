require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe "#valid?" do
    context "when source_name is not given" do
      subject { Donation.new(source_address: "Some address", quantity: 50, food_type: "Soup", anonymous: true, information_source: "Jane Doe", status: "OK", available_from: Date.today, available_to: Date.today).valid? }

      it { is_expected.to eq false }
    end

    context "when quantity is lower than minimal donation quantity" do
      subject { Donation.new(source_name: "John Doe's restaurant", source_address: "Some address", quantity: 5, food_type: "Soup", anonymous: true, information_source: "Jane Doe", status: "OK", available_from: Date.today, available_to: Date.today).valid? }

      it { is_expected.to eq false }
    end

    context "when not_perishable is false" do
      subject do
        donation = Donation.new(source_name: "John Doe's restaurant", source_address: "Some address", quantity: 50, food_type: "Soup", anonymous: true, information_source: "Jane Doe", status: "OK", available_from: Date.today, available_to: Date.today)
        donation.not_perishable = false
        donation.valid?
      end

      it { is_expected.to eq false }
    end
  end
end
