require 'spec_helper'

describe "config/projects/show" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Phase,
      :project_name => "Project Name",
      :studio => "Studio",
      :client => "Client",
      :services_scope => "MyText",
      :delivery_contract => "MyText",
      :staff_contact_login => "Staff Contact Login",
      :staff_custodian_login => "Staff Custodian Login",
      :initial_phase_value_total => 1.5,
      :final_phase_value_total => 1.5,
      :initial_phase_fee_total => 1.5,
      :final_phase_fee_total => 1.5,
      :construction_initial => 1.5,
      :construction_final => 1.5,
      :comments => "MyText",
      :fee_type => "Fee Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Project Name/)
    rendered.should match(/Studio/)
    rendered.should match(/Client/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Staff Contact Login/)
    rendered.should match(/Staff Custodian Login/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/MyText/)
    rendered.should match(/Fee Type/)
  end
end
