require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:gross_building_areas, [
      stub_model(GrossBuildingArea,
        :measurement => 1.5,
        :standard_name => "Standard Name",
        :standard_version => "Standard Version"
      ),
      stub_model(GrossBuildingArea,
        :measurement => 1.5,
        :standard_name => "Standard Name",
        :standard_version => "Standard Version"
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Standard Name".to_s, :count => 2
    assert_select "tr>td", :text => "Standard Version".to_s, :count => 2
  end
end
