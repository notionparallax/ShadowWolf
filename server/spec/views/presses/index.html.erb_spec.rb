require 'spec_helper'

describe "presses/index" do
  before(:each) do
    assign(:presses, [
      stub_model(Press),
      stub_model(Press)
    ])
  end

  it "renders a list of presses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
