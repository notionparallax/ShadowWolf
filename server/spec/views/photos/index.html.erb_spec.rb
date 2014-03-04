require 'spec_helper'

describe "config/people/index" do
  before(:each) do
    assign(:photos, [
      stub_model(Photo,
        :fun => "Fun",
        :bw => "Bw",
        :colour => "Colour"
      ),
      stub_model(Photo,
        :fun => "Fun",
        :bw => "Bw",
        :colour => "Colour"
      )
    ])
  end

  it "renders a list of config/people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Fun".to_s, :count => 2
    assert_select "tr>td", :text => "Bw".to_s, :count => 2
    assert_select "tr>td", :text => "Colour".to_s, :count => 2
  end
end
