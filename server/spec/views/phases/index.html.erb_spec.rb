require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:phases, [
      stub_model(Phase,
        :project_name => "Project Name",
        :studio => "Studio",
        :client => "Client",
        :services_scope => "MyText",
        :delivery_contract => "MyText",
        :staff_contact_login => "Staff Contact Login",
        :staff_custodian_login => "Staff Custodian Login"
      ),
      stub_model(Phase,
        :project_name => "Project Name",
        :studio => "Studio",
        :client => "Client",
        :services_scope => "MyText",
        :delivery_contract => "MyText",
        :staff_contact_login => "Staff Contact Login",
        :staff_custodian_login => "Staff Custodian Login"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Project Name".to_s, :count => 2
    assert_select "tr>td", :text => "Studio".to_s, :count => 2
    assert_select "tr>td", :text => "Client".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Staff Contact Login".to_s, :count => 2
    assert_select "tr>td", :text => "Staff Custodian Login".to_s, :count => 2
  end
end
