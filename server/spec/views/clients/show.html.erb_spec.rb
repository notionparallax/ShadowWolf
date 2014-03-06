require 'spec_helper'

describe "config/projects/show" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Client,
      :main => "Main",
      :direct => "Direct",
      :end_user => "End User"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Main/)
    rendered.should match(/Direct/)
    rendered.should match(/End User/)
  end
end
