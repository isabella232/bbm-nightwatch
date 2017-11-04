require 'rails_helper'

RSpec.describe "Donations", type: :request do
  describe "GET /donations" do
    it "works" do
      get donations_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /donations/new" do
    it "works" do
      get new_donation_path
      expect(response).to have_http_status(200)
    end
  end
end
