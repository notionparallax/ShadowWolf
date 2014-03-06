require 'spec_helper'

describe "config/people/show" do
  before(:each) do
    @config_person = assign(:config_person, stub_model(Registration,
      :organisation => "Organisation",
      :registration_number => "Registration Number",
      :state => "State",
      :country => "Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Organisation/)
    rendered.should match(/Registration Number/)
    rendered.should match(/State/)
    rendered.should match(/Country/)
  end
end
