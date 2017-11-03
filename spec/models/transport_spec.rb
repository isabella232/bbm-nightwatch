require 'rails_helper'

RSpec.describe Transport, type: :model do
  describe "#valid?" do
    context "when email is not given" do
      subject { Transport.new(name: "John Doe").valid? }

      it { is_expected.to eq false }
    end

    context "when email is not valid" do
      subject { Transport.new(email: "notvalid@localhost", name: "John Doe").valid? }

      it { is_expected.to eq false }
    end
  end
end