require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:clients, [
      stub_model(Client,
        :main => "Main",
        :direct => "Direct",
        :end_user => "End User"
      ),
      stub_model(Client,
        :main => "Main",
        :direct => "Direct",
        :end_user => "End User"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Main".to_s, :count => 2
    assert_select "tr>td", :text => "Direct".to_s, :count => 2
    assert_select "tr>td", :text => "End User".to_s, :count => 2
  end
end
