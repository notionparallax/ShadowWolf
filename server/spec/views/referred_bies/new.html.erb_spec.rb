require 'spec_helper'

describe "config/projects/new" do
  before(:each) do
    assign(:config_project, stub_model(ReferredBy,
      :BVN_staff_login => "MyString",
      :contact_name => "MyString",
      :contact_organisation => "MyString"
    ).as_new_record)
  end

  it "renders new config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", referred_bies_path, "post" do
      assert_select "input#config_project_BVN_staff_login[name=?]", "config_project[BVN_staff_login]"
      assert_select "input#config_project_contact_name[name=?]", "config_project[contact_name]"
      assert_select "input#config_project_contact_organisation[name=?]", "config_project[contact_organisation]"
    end
  end
end
