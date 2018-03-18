require 'rails_helper'

RSpec.describe SubscribersController, type: :controller do
  let(:valid_attributes) { {email: 'subscriber@example.com'} }
  let(:invalid_attributes) { {email: 'not-an-email'} }

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Subscriber" do
        expect {
          post :create, params: {subscriber: valid_attributes}
        }.to change(Subscriber, :count).by(1)
      end

      it "redirects to the root path" do
        post :create, params: {subscriber: valid_attributes}
        expect(response).to redirect_to(root_path)
      end

      context 'when email already saved' do
        before { create :subscriber, email: 'subscriber@example.com' }

        it "does not create a new Subscriber" do
          expect {
            post :create, params: {subscriber: valid_attributes}
          }.not_to change(Subscriber, :count)
        end
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {subscriber: invalid_attributes}
        expect(response).to be_success
      end
    end
  end
end
