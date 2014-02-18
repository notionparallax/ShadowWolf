require 'spec_helper'

describe "config/projects/show" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Height,
      :measurement => "",
      :standard_name => "Standard Name",
      :standard_version => "Standard Version"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Standard Name/)
    rendered.should match(/Standard Version/)
  end
end
