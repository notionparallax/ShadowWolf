require 'spec_helper'

describe "project_experiences/edit" do
  before(:each) do
    @project_experience = assign(:project_experience, stub_model(ProjectExperience,
      :name => "MyString",
      :firm => "MyString",
      :role => "MyString",
      :stage => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit project_experience form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", project_experience_path(@project_experience), "post" do
      assert_select "input#project_experience_name[name=?]", "project_experience[name]"
      assert_select "input#project_experience_firm[name=?]", "project_experience[firm]"
      assert_select "input#project_experience_role[name=?]", "project_experience[role]"
      assert_select "input#project_experience_stage[name=?]", "project_experience[stage]"
      assert_select "input#project_experience_url[name=?]", "project_experience[url]"
    end
  end
end
