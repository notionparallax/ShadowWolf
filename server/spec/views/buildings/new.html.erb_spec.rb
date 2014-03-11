require 'spec_helper'

describe "config/projects/new" do
  before(:each) do
    assign(:config_project, stub_model(Building,
      :description => "MyText",
      :attribution => "MyString",
      :BCA_classification => "MyString",
      :project_categories => "",
      :project_sub_catagories => ""
    ).as_new_record)
  end

  it "renders new config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", buildings_path, "post" do
      assert_select "textarea#config_project_description[name=?]", "config_project[description]"
      assert_select "input#config_project_attribution[name=?]", "config_project[attribution]"
      assert_select "input#config_project_BCA_classification[name=?]", "config_project[BCA_classification]"
      assert_select "input#config_project_project_categories[name=?]", "config_project[project_categories]"
      assert_select "input#config_project_project_sub_catagories[name=?]", "config_project[project_sub_catagories]"
    end
  end
end
