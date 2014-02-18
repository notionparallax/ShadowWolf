require 'spec_helper'

describe "config/projects/index" do
  before(:each) do
    assign(:geo_jsons, [
      stub_model(GeoJson,
        :lat => "",
        :lon => "",
        :boundary_points => ""
      ),
      stub_model(GeoJson,
        :lat => "",
        :lon => "",
        :boundary_points => ""
      )
    ])
  end

  it "renders a list of config/projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
