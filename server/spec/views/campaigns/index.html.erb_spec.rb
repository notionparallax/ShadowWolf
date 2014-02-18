require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:campaigns, [
      stub_model(Campaign,
        :strategy => "MyText"
      ),
      stub_model(Campaign,
        :strategy => "MyText"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
