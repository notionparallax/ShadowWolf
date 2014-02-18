require 'spec_helper'

describe "config/projects/edit" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Phase,
      :project_name => "MyString",
      :studio => "MyString",
      :client => "MyString",
      :services_scope => "MyText",
      :delivery_contract => "MyText",
      :staff_contact_login => "MyString",
      :staff_custodian_login => "MyString",
      :initial_phase_value_total => 1.5,
      :final_phase_value_total => 1.5,
      :initial_phase_fee_total => 1.5,
      :final_phase_fee_total => 1.5,
      :construction_initial => 1.5,
      :construction_final => 1.5,
      :comments => "MyText",
      :fee_type => "MyString"
    ))
  end

  it "renders the edit config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_project_path(@config_project), "post" do
      assert_select "input#config_project_project_name[name=?]", "config_project[project_name]"
      assert_select "input#config_project_studio[name=?]", "config_project[studio]"
      assert_select "input#config_project_client[name=?]", "config_project[client]"
      assert_select "textarea#config_project_services_scope[name=?]", "config_project[services_scope]"
      assert_select "textarea#config_project_delivery_contract[name=?]", "config_project[delivery_contract]"
      assert_select "input#config_project_staff_contact_login[name=?]", "config_project[staff_contact_login]"
      assert_select "input#config_project_staff_custodian_login[name=?]", "config_project[staff_custodian_login]"
      assert_select "input#config_project_initial_phase_value_total[name=?]", "config_project[initial_phase_value_total]"
      assert_select "input#config_project_final_phase_value_total[name=?]", "config_project[final_phase_value_total]"
      assert_select "input#config_project_initial_phase_fee_total[name=?]", "config_project[initial_phase_fee_total]"
      assert_select "input#config_project_final_phase_fee_total[name=?]", "config_project[final_phase_fee_total]"
      assert_select "input#config_project_construction_initial[name=?]", "config_project[construction_initial]"
      assert_select "input#config_project_construction_final[name=?]", "config_project[construction_final]"
      assert_select "textarea#config_project_comments[name=?]", "config_project[comments]"
      assert_select "input#config_project_fee_type[name=?]", "config_project[fee_type]"
    end
  end
end
