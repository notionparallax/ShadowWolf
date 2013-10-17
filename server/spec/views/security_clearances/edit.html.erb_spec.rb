require 'spec_helper'

describe "security_clearances/edit" do
  before(:each) do
    @security_clearance = assign(:security_clearance, stub_model(SecurityClearance,
      :issuing_body => "MyString",
      :level => "MyString"
    ))
  end

  it "renders the edit security_clearance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", security_clearance_path(@security_clearance), "post" do
      assert_select "input#security_clearance_issuing_body[name=?]", "security_clearance[issuing_body]"
      assert_select "input#security_clearance_level[name=?]", "security_clearance[level]"
    end
  end
end
