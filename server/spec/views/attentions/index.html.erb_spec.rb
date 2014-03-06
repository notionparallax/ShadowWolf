require 'spec_helper'

describe "config/people/index" do
  before(:each) do
    assign(:attentions, [
      stub_model(Attention,
        :url => "Url",
        :scan_or_screengrab => "Scan Or Screengrab",
        :body_text => "MyText",
        :publication => "Publication",
        :reason => "Reason"
      ),
      stub_model(Attention,
        :url => "Url",
        :scan_or_screengrab => "Scan Or Screengrab",
        :body_text => "MyText",
        :publication => "Publication",
        :reason => "Reason"
      )
    ])
  end

  it "renders a list of config/people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Scan Or Screengrab".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Publication".to_s, :count => 2
    assert_select "tr>td", :text => "Reason".to_s, :count => 2
  end
end
