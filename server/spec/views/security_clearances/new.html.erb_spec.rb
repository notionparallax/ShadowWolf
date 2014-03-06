require 'spec_helper'

describe "config/people/new" do
  before(:each) do
    assign(:config_person, stub_model(SecurityClearance,
      :issuing_body => "MyString",
      :level => "MyString"
    ).as_new_record)
  end

  it "renders new config_person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", security_clearances_path, "post" do
      assert_select "input#config_person_issuing_body[name=?]", "config_person[issuing_body]"
      assert_select "input#config_person_level[name=?]", "config_person[level]"
    end
  end
end
