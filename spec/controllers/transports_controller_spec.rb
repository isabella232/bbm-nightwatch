require 'rails_helper'

RSpec.describe TransportsController, type: :controller do
  let(:donation) { create :donation }
  let(:valid_attributes) do
    {
      name: 'Futár Ferenc',
      email: 'contact@example.com'
    }
  end

  let(:invalid_attributes) do
    {
      name: '',
      email: 'not_an_email'
    }
  end

  let(:valid_session) { {} }

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {donation_id: donation.id}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Donation" do
        expect {
          post :create, params: {donation_id: donation.id, transport: valid_attributes}, session: valid_session
        }.to change(Donation, :count).by(1)
      end

      it "redirects to the created donation" do
        post :create, params: {donation_id: donation.id, transport: valid_attributes}, session: valid_session
        expect(response).to redirect_to(donation_path(donation.id))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {donation_id: donation.id, transport: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

end
