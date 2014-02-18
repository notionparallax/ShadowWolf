require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:addresses, [
      stub_model(Address,
        :building_name => "Building Name",
        :street_number => "Street Number",
        :street => "Street",
        :suburb_area => "Suburb Area",
        :state_county => "State County",
        :country => "Country",
        :postcode => "Postcode"
      ),
      stub_model(Address,
        :building_name => "Building Name",
        :street_number => "Street Number",
        :street => "Street",
        :suburb_area => "Suburb Area",
        :state_county => "State County",
        :country => "Country",
        :postcode => "Postcode"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Building Name".to_s, :count => 2
    assert_select "tr>td", :text => "Street Number".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "Suburb Area".to_s, :count => 2
    assert_select "tr>td", :text => "State County".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
  end
end
