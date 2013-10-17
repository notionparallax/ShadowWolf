require 'spec_helper'

describe "security_clearances/show" do
  before(:each) do
    @security_clearance = assign(:security_clearance, stub_model(SecurityClearance,
      :issuing_body => "Issuing Body",
      :level => "Level"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Issuing Body/)
    rendered.should match(/Level/)
  end
end
