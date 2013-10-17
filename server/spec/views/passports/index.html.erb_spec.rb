require 'spec_helper'

describe "passports/index" do
  before(:each) do
    assign(:passports, [
      stub_model(Passport,
        :number => "Number",
        :issuing_body => "Issuing Body"
      ),
      stub_model(Passport,
        :number => "Number",
        :issuing_body => "Issuing Body"
      )
    ])
  end

  it "renders a list of passports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Issuing Body".to_s, :count => 2
  end
end
