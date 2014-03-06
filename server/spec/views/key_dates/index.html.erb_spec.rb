require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:key_dates, [
      stub_model(KeyDate),
      stub_model(KeyDate)
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
