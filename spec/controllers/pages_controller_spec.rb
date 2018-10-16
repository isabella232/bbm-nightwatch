require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #home" do
    it "returns a success response" do
      get :home
      expect(response).to be_successful
    end
  end

  describe "GET #landing" do
    context "when there are success stories" do
      before { create_list(:success_story, 3) }

      it "returns a success response" do
        get :landing
        expect(response).to be_successful
      end
    end

    context "when there are no success stories" do
      it "returns a success response" do
        get :landing
        expect(response).to be_successful
      end
    end
  end


end
