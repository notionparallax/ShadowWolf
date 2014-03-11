require 'spec_helper'

describe "config/projects/new" do
  before(:each) do
    assign(:config_project, stub_model(Phase,
      :dirty_members => "MyString",
      :project_name => "MyString",
      :studio => "MyString",
      :client => "MyString",
      :services_scope => "MyText",
      :delivery_contract => "MyText",
      :staff_contact_login => "MyString",
      :staff_custodian_login => "MyString",
      :dirty_date => "MyString"
    ).as_new_record)
  end

  it "renders new config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", phases_path, "post" do
      assert_select "input#config_project_dirty_members[name=?]", "config_project[dirty_members]"
      assert_select "input#config_project_project_name[name=?]", "config_project[project_name]"
      assert_select "input#config_project_studio[name=?]", "config_project[studio]"
      assert_select "input#config_project_client[name=?]", "config_project[client]"
      assert_select "textarea#config_project_services_scope[name=?]", "config_project[services_scope]"
      assert_select "textarea#config_project_delivery_contract[name=?]", "config_project[delivery_contract]"
      assert_select "input#config_project_staff_contact_login[name=?]", "config_project[staff_contact_login]"
      assert_select "input#config_project_staff_custodian_login[name=?]", "config_project[staff_custodian_login]"
      assert_select "input#config_project_dirty_date[name=?]", "config_project[dirty_date]"
    end
  end
end
