require 'rails_helper'

RSpec.describe SubscribersController, type: :controller do
  let(:valid_attributes) { {email: 'subscriber@example.com', name: 'John Doe'} }
  let(:invalid_attributes) { {email: 'not-an-email'} }
  let(:admins) { create_list :user, 2, role: "admin" }
  let(:non_admins) { create_list :user, 2, role: "non_admin" }

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    subject(:create_subscriber) { post :create, params: {subscriber: valid_attributes} }

    context "with valid params" do
      it "creates a new Subscriber" do
        expect { create_subscriber }.to change(Subscriber, :count).by(1)
      end

      it "sends email notification to all admins" do
        email = double 'email'
        expect(email).to receive(:deliver_later).twice
        admins.each { |u| expect(SubscriberMailer).to receive(:new_subscription_notification).with(u, anything).and_return(email) }
        non_admins.each { |u| expect(SubscriberMailer).to_not receive(:new_subscription_notification).with(u, anything) }

        create_subscriber
      end

      it 'sends a welcome email to the new subscriber' do
        email = spy 'email'
        allow(SubscriberMailer).to receive(:welcome_notification).and_return(email)

        create_subscriber

        subscriber = Subscriber.find_by valid_attributes
        expect(SubscriberMailer).to have_received(:welcome_notification).with(subscriber)
        expect(email).to have_received(:deliver_later)
      end

      it "redirects to the root path" do
        post :create, params: {subscriber: valid_attributes}
        expect(response).to redirect_to(root_path)
      end

      context 'when email already saved' do
        before { create :subscriber, email: 'subscriber@example.com' }

        it "does not create a new Subscriber" do
          expect { create_subscriber }.not_to change(Subscriber, :count)
        end
      end
    end

    context "with invalid params" do
      let(:valid_attributes) { invalid_attributes }

      it "returns a success response (i.e. to display the 'new' template)" do
        create_subscriber
        expect(response).to be_successful
      end
    end
  end
end
