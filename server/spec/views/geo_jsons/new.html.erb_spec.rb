require 'spec_helper'

describe "config/projects/new" do
  before(:each) do
    assign(:config_project, stub_model(GeoJson,
      :lat => "",
      :lon => "",
      :boundary_points => ""
    ).as_new_record)
  end

  it "renders new config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", geo_jsons_path, "post" do
      assert_select "input#config_project_lat[name=?]", "config_project[lat]"
      assert_select "input#config_project_lon[name=?]", "config_project[lon]"
      assert_select "input#config_project_boundary_points[name=?]", "config_project[boundary_points]"
    end
  end
end
