require 'spec_helper'

describe "config/projects/show" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Address,
      :building_name => "Building Name",
      :street_number => "Street Number",
      :street => "Street",
      :suburb_area => "Suburb Area",
      :state_county => "State County",
      :country => "Country",
      :postcode => "Postcode"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Building Name/)
    rendered.should match(/Street Number/)
    rendered.should match(/Street/)
    rendered.should match(/Suburb Area/)
    rendered.should match(/State County/)
    rendered.should match(/Country/)
    rendered.should match(/Postcode/)
  end
end
