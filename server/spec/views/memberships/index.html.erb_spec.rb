require 'spec_helper'

describe "config/people/index" do
  before(:each) do
    assign(:memberships, [
      stub_model(Membership,
        :organisation => "Organisation",
        :membership_number => "Membership Number",
        :state => "State",
        :country => "Country"
      ),
      stub_model(Membership,
        :organisation => "Organisation",
        :membership_number => "Membership Number",
        :state => "State",
        :country => "Country"
      )
    ])
  end

  it "renders a list of config/people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Organisation".to_s, :count => 2
    assert_select "tr>td", :text => "Membership Number".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
  end
end
