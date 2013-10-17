require 'spec_helper'

describe "security_clearances/new" do
  before(:each) do
    assign(:security_clearance, stub_model(SecurityClearance,
      :issuing_body => "MyString",
      :level => "MyString"
    ).as_new_record)
  end

  it "renders new security_clearance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", security_clearances_path, "post" do
      assert_select "input#security_clearance_issuing_body[name=?]", "security_clearance[issuing_body]"
      assert_select "input#security_clearance_level[name=?]", "security_clearance[level]"
    end
  end
end
