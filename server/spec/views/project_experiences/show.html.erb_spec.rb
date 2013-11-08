require 'spec_helper'

describe "config/models/show" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(ProjectExperience,
      :name => "Name",
      :firm => "Firm",
      :role => "Role",
      :stage => "Stage",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Firm/)
    rendered.should match(/Role/)
    rendered.should match(/Stage/)
    rendered.should match(/Url/)
  end
end
