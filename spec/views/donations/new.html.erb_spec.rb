require 'rails_helper'

RSpec.describe "donations/new", type: :view do
  before(:each) do
    assign(:donation, Donation.new(
      :source_name => "MyString",
      :source_address => "MyString",
      :quantity => 1,
      :food_type => "MyString",
      :anonymous => false,
      :information_source => "MyString",
      :status => "MyString"
    ))
  end

  it "renders new donation form" do
    render

    assert_select "form[action=?][method=?]", donations_path, "post" do

      assert_select "input[name=?]", "donation[source_name]"

      assert_select "input[name=?]", "donation[source_address]"

      assert_select "input[name=?]", "donation[quantity]"

      assert_select "input[name=?]", "donation[food_type]"

      assert_select "input[name=?]", "donation[anonymous]"

      assert_select "input[name=?]", "donation[information_source]"

      assert_select "input[name=?]", "donation[status]"
    end
  end
end
