require 'spec_helper'

describe "config/projects/edit" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Height,
      :measurement => "",
      :standard_name => "MyString",
      :standard_version => "MyString"
    ))
  end

  it "renders the edit config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_project_path(@config_project), "post" do
      assert_select "input#config_project_measurement[name=?]", "config_project[measurement]"
      assert_select "input#config_project_standard_name[name=?]", "config_project[standard_name]"
      assert_select "input#config_project_standard_version[name=?]", "config_project[standard_version]"
    end
  end
end
