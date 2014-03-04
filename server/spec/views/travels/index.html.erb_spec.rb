require 'spec_helper'

describe "config/people/index" do
  before(:each) do
    assign(:travels, [
      stub_model(Travel),
      stub_model(Travel)
    ])
  end

  it "renders a list of config/people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
