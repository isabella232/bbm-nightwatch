require 'rails_helper'

RSpec.describe "donations/show", type: :view do
  before(:each) do
    @donation = assign(:donation, Donation.create!(
      :source_name => "Source Name",
      :source_address => "Source Address",
      :quantity => 200,
      :food_type => "Food Type",
      :anonymous => false,
      :information_source => "Information Source",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Source Name/)
    expect(rendered).to match(/Source Address/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Food Type/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Information Source/)
    expect(rendered).to match(/Status/)
  end
end
