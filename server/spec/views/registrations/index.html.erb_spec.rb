require 'spec_helper'

describe "config/people/index" do
  before(:each) do
    assign(:registrations, [
      stub_model(Registration,
        :organisation => "Organisation",
        :registration_number => "Registration Number",
        :state => "State",
        :country => "Country"
      ),
      stub_model(Registration,
        :organisation => "Organisation",
        :registration_number => "Registration Number",
        :state => "State",
        :country => "Country"
      )
    ])
  end

  it "renders a list of config/people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Organisation".to_s, :count => 2
    assert_select "tr>td", :text => "Registration Number".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
  end
end
