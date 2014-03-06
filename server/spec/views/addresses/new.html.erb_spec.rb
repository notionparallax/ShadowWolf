require 'spec_helper'

describe "config/projects/new" do
  before(:each) do
    assign(:config_project, stub_model(Address,
      :building_name => "MyString",
      :street_number => "MyString",
      :street => "MyString",
      :suburb_area => "MyString",
      :state_county => "MyString",
      :country => "MyString",
      :postcode => "MyString"
    ).as_new_record)
  end

  it "renders new config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", addresses_path, "post" do
      assert_select "input#config_project_building_name[name=?]", "config_project[building_name]"
      assert_select "input#config_project_street_number[name=?]", "config_project[street_number]"
      assert_select "input#config_project_street[name=?]", "config_project[street]"
      assert_select "input#config_project_suburb_area[name=?]", "config_project[suburb_area]"
      assert_select "input#config_project_state_county[name=?]", "config_project[state_county]"
      assert_select "input#config_project_country[name=?]", "config_project[country]"
      assert_select "input#config_project_postcode[name=?]", "config_project[postcode]"
    end
  end
end
