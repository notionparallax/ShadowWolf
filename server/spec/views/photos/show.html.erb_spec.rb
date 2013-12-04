require 'spec_helper'

describe "config/models/show" do
  before(:each) do
    @config_model = assign(:config_model, stub_model(Photo,
      :fun => "Fun",
      :bw => "Bw",
      :colour => "Colour"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Fun/)
    rendered.should match(/Bw/)
    rendered.should match(/Colour/)
  end
end
