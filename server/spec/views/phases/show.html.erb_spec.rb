require 'spec_helper'

describe "config/projects/show" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Phase,
      :dirty_members => "Dirty Members",
      :project_name => "Project Name",
      :studio => "Studio",
      :client => "Client",
      :services_scope => "MyText",
      :delivery_contract => "MyText",
      :staff_contact_login => "Staff Contact Login",
      :staff_custodian_login => "Staff Custodian Login",
      :dirty_date => "Dirty Date",
      :referee => "Referee",
      :dirty_finish => "Dirty Finish"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Dirty Members/)
    rendered.should match(/Project Name/)
    rendered.should match(/Studio/)
    rendered.should match(/Client/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Staff Contact Login/)
    rendered.should match(/Staff Custodian Login/)
    rendered.should match(/Dirty Date/)
    rendered.should match(/Referee/)
    rendered.should match(/Dirty Finish/)
  end
end
