require 'rails_helper'

RSpec.describe DonationsController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      donation = Donation.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      donation = Donation.create! valid_attributes
      get :show, params: {id: donation.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Donation" do
        expect {
          post :create, params: {donation: valid_attributes}, session: valid_session
        }.to change(Donation, :count).by(1)
      end

      it "redirects to the created donation" do
        post :create, params: {donation: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Donation.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {donation: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

end
