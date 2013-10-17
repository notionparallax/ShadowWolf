require 'spec_helper'

describe "security_clearances/index" do
  before(:each) do
    assign(:security_clearances, [
      stub_model(SecurityClearance,
        :issuing_body => "Issuing Body",
        :level => "Level"
      ),
      stub_model(SecurityClearance,
        :issuing_body => "Issuing Body",
        :level => "Level"
      )
    ])
  end

  it "renders a list of security_clearances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Issuing Body".to_s, :count => 2
    assert_select "tr>td", :text => "Level".to_s, :count => 2
  end
end
