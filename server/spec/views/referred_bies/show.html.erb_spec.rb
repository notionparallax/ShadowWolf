require 'spec_helper'

describe "config/projects/show" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(ReferredBy,
      :BVN_staff_login => "Bvn Staff Login",
      :contact_name => "Contact Name",
      :contact_organisation => "Contact Organisation"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Bvn Staff Login/)
    rendered.should match(/Contact Name/)
    rendered.should match(/Contact Organisation/)
  end
end
