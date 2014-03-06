require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:building_presses, [
      stub_model(BuildingPress),
      stub_model(BuildingPress)
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
