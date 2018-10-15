require 'rails_helper'

RSpec.describe DonationsController, type: :controller do
  let(:valid_attributes) do
    {
      contact_name: 'Kapcsolat Tartó',
      contact_phone: '+36 90 5555555',
      source_name: 'Kajagyár Kft.',
      source_address: '1111 Budapest, Valahol út 1.',
      food_type: 'Bread',
      available_from: '2017-11-03 14:30',
      available_to: '2017-11-03 16:30',
      quantity: 51,
      not_perishable: true
    }
  end

  let(:invalid_attributes) do
    {
      quantity: 13
    }
  end

  let(:valid_session) { {} }

  let(:user) { create :user }
  before { sign_in user }

  describe "GET #index" do
    it "returns a success response" do
      donation = create :donation
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      donation = create :donation
      get :show, params: {id: donation.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Donation" do
        expect {
          post :create, params: {donation: valid_attributes}, session: valid_session
        }.to change(Donation, :count).by(1)
      end

      it "saves user_id on the new Donation" do
        expect {
          post :create, params: {donation: valid_attributes}, session: valid_session
        }.to change(user.donations, :count).by(1)
      end

      it "redirects to the created donation" do
        post :create, params: {donation: valid_attributes}, session: valid_session
        expect(response).to redirect_to(thank_you_donations_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {donation: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

end
