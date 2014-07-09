require 'spec_helper'

describe "config/projects/edit" do
  before(:each) do
    @config_project = assign(:config_project, stub_model(Project,
      :project_number => "MyString",
      :img => "MyString",
      :value => "MyString"
    ))
  end

  it "renders the edit config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", config_project_path(@config_project), "post" do
      assert_select "input#config_project_project_number[name=?]", "config_project[project_number]"
      assert_select "input#config_project_img[name=?]", "config_project[img]"
      assert_select "input#config_project_value[name=?]", "config_project[value]"
    end
  end
end
