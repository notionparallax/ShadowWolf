require 'spec_helper'

describe "config/projects/new" do
  before(:each) do
    assign(:config_project, stub_model(NetLettableArea,
      :measurement => "",
      :standard_name => "MyString",
      :standard_version => "MyString"
    ).as_new_record)
  end

  it "renders new config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", net_lettable_areas_path, "post" do
      assert_select "input#config_project_measurement[name=?]", "config_project[measurement]"
      assert_select "input#config_project_standard_name[name=?]", "config_project[standard_name]"
      assert_select "input#config_project_standard_version[name=?]", "config_project[standard_version]"
    end
  end
end
