require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:environmental_sustainable_designs, [
      stub_model(EnvironmentalSustainableDesign),
      stub_model(EnvironmentalSustainableDesign)
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
