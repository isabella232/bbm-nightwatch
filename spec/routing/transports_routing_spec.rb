require "rails_helper"

RSpec.describe TransportsController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/donations/1/transports/new").to route_to("transports#new", donation_id: "1")
    end

    it "routes to #create" do
      expect(:post => "/donations/1/transports").to route_to("transports#create", donation_id: "1")
    end

  end
end
