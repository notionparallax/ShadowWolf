require 'spec_helper'

describe "config/projects/new" do
  before(:each) do
    assign(:config_project, stub_model(Legacy,
      :one_line_grab => "MyText",
      :description_project_sheet => "MyText",
      :description_awards_style => "MyText",
      :innovation_client_style => "MyText",
      :interesting_things => "MyText",
      :brief_elements => "MyText",
      :security_level => "MyString"
    ).as_new_record)
  end

  it "renders new config_project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", legacies_path, "post" do
      assert_select "textarea#config_project_one_line_grab[name=?]", "config_project[one_line_grab]"
      assert_select "textarea#config_project_description_project_sheet[name=?]", "config_project[description_project_sheet]"
      assert_select "textarea#config_project_description_awards_style[name=?]", "config_project[description_awards_style]"
      assert_select "textarea#config_project_innovation_client_style[name=?]", "config_project[innovation_client_style]"
      assert_select "textarea#config_project_interesting_things[name=?]", "config_project[interesting_things]"
      assert_select "textarea#config_project_brief_elements[name=?]", "config_project[brief_elements]"
      assert_select "input#config_project_security_level[name=?]", "config_project[security_level]"
    end
  end
end
