require 'rails_helper'

RSpec.describe "donations/index", type: :view do
  before(:each) do
    assign(:donations, [
      Donation.create!(
        :source_name => "Source Name",
        :source_address => "Source Address",
        :quantity => 200,
        :food_type => "Food Type",
        :anonymous => false,
        :information_source => "Information Source",
        :status => "Status"
      ),
      Donation.create!(
        :source_name => "Source Name",
        :source_address => "Source Address",
        :quantity => 200,
        :food_type => "Food Type",
        :anonymous => false,
        :information_source => "Information Source",
        :status => "Status"
      )
    ])
  end

  it "renders a list of donations" do
    render
    assert_select "tr>td", :text => "Source Name".to_s, :count => 2
    assert_select "tr>td", :text => "Source Address".to_s, :count => 2
    assert_select "tr>td", :text => 200.to_s, :count => 2
    assert_select "tr>td", :text => "Food Type".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Information Source".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
