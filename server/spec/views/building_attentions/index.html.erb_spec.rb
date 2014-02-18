require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:building_attentions, [
      stub_model(BuildingAttention,
        :url => "Url",
        :scan_or_screengrab => "Scan Or Screengrab",
        :body_text => "MyText",
        :publication => "Publication",
        :reason => "Reason"
      ),
      stub_model(BuildingAttention,
        :url => "Url",
        :scan_or_screengrab => "Scan Or Screengrab",
        :body_text => "MyText",
        :publication => "Publication",
        :reason => "Reason"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Scan Or Screengrab".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Publication".to_s, :count => 2
    assert_select "tr>td", :text => "Reason".to_s, :count => 2
  end
end
