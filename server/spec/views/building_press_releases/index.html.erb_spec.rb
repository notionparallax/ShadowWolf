require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:building_press_releases, [
      stub_model(BuildingPressRelease,
        :channel_list => "Channel List",
        :content => "MyText",
        :author_login => "Author Login"
      ),
      stub_model(BuildingPressRelease,
        :channel_list => "Channel List",
        :content => "MyText",
        :author_login => "Author Login"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Channel List".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Author Login".to_s, :count => 2
  end
end
