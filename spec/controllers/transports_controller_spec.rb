require 'rails_helper'

RSpec.describe TransportsController, type: :controller do
  let(:donation) { create :donation }
  let(:valid_attributes) do
    {
      name: 'Futár Ferenc',
      phone: '+36 90 555 5555',
      email: 'contact@example.com'
    }
  end

  let(:invalid_attributes) do
    {
      name: '',
      phone: '',
      email: 'not_an_email'
    }
  end

  let(:user) { create :user }
  before { sign_in user }

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {donation_id: donation.id}
      expect(response).to be_success
    end

    context "donation is not assignable" do
      let(:donation) { create :donation, status: "assigned" }

      it "redirects to donation" do
        get :new, params: {donation_id: donation.id}
        expect(response).to redirect_to(donation_path(donation.id))
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      subject { post :create, params: {donation_id: donation.id, transport: valid_attributes} }

      it "creates a new Transport" do
        expect { subject }.to change(Transport, :count).by(1)
      end

      it "saves transporter on the new Transport" do
        expect { subject }.to change(user.transports, :count).by(1)
      end

      it "redirects to the created donation" do
        subject
        expect(response).to redirect_to(donation_path(donation.id))
      end
    end

    context "donation is not assignable" do
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {donation_id: donation.id, transport: invalid_attributes}
        expect(response).to be_success
      end
    end
  end

  describe "GET #close" do
    let(:donation) { transport.donation }
    let(:transport) { create :transport, transporter: user }
    subject { get :close, params: {id: transport.id} }

    it "returns a success response" do
      subject
      expect(response).to be_success
    end

    context "donation is already transported" do
      let(:donation) { create :donation, status: 'transported' }
      let(:transport) { create :transport, transporter: user, donation: donation }

      it "redirects" do
        subject
        expect(response).to redirect_to(donation_path(donation.id))
      end
    end

    context "someone else's transport" do
      let(:other_user) { create :user }
      let(:transport) { create :transport, transporter: other_user }

      it "redirects" do
        subject
        expect(response).to redirect_to(donation_path(donation.id))
      end
    end
  end

  describe "PATCH #finish" do
    let(:donation) { transport.donation }
    let(:transport) { create :transport, transporter: user }
    subject { patch :finish, params: params }
    let(:params) { {id: transport.id, transport: { target_location: "Target" }} }

    it "updates the transport" do
      expect { subject}
        .to change { transport.reload.target_location }.to("Target")
    end

    it "finish the donation" do
      expect { subject }
        .to change { donation.reload.status }.to("transported")
    end

    it "redirects to donation" do
      subject
      expect(response).to redirect_to(transports_path)
    end

    context "donation is already transported" do
      let(:donation) { create :donation, status: 'transported' }
      let(:transport) { create :transport, transporter: user, donation: donation }

      it "does not change transport" do
        expect { subject }
          .not_to change { transport.reload.attributes }
      end

      it "does not change donation" do
        expect { subject }
          .not_to change { donation.reload.attributes }
      end
    end

    context "someone else's transport" do
      let(:other_user) { create :user }
      let(:transport) { create :transport, transporter: other_user }

      it "does not change transport" do
        expect { subject }
          .not_to change { transport.reload.attributes }
      end

      it "does not change donation" do
        expect { subject }
          .not_to change { donation.reload.attributes }
      end
    end
  end
end
