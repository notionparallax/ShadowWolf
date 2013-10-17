require 'spec_helper'

describe "project_experiences/new" do
  before(:each) do
    assign(:project_experience, stub_model(ProjectExperience,
      :name => "MyString",
      :firm => "MyString",
      :role => "MyString",
      :stage => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new project_experience form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_experiences_path, "post" do
      assert_select "input#project_experience_name[name=?]", "project_experience[name]"
      assert_select "input#project_experience_firm[name=?]", "project_experience[firm]"
      assert_select "input#project_experience_role[name=?]", "project_experience[role]"
      assert_select "input#project_experience_stage[name=?]", "project_experience[stage]"
      assert_select "input#project_experience_url[name=?]", "project_experience[url]"
    end
  end
end
