require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:locations, [
      stub_model(Location),
      stub_model(Location)
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
